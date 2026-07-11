# Look up your current AWS Account ID dynamically to avoid hardcoding it!
data "aws_caller_identity" "current" {}

# --- 1. IAM Group ---
resource "aws_iam_group" "developers" {
  name = var.iam_group_name
}

# --- 2. IAM User ---
resource "aws_iam_user" "admin_user" {
  name = var.iam_user_name

  tags = {
    Description = "Access key for Database Services"
  }
  
  lifecycle {
    ignore_changes = [
      tags["Environment"]
    ]
  }
}

# --- 3. Lambda Execution Role ---
resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# --- 4. Custom Custom Lambda Execution Policy ---
resource "aws_iam_policy" "lambda_policy" {
  name        = "${var.lambda_role_name}-policy"
  description = "Dynamic execution permissions for storage and log structures"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Effect = "Allow",
            Action = [
                "s3:GetObject",
                "s3:PutObject"
            ],
            Resource = [
                "${var.pdf_files_bucket_arn}/*"
            ]
        },
        {
            Effect = "Allow",
            Action = [
                "s3:GetObject"
            ],
            Resource = [
                "${var.pdf_templates_bucket_arn}/*"
            ]
        },
        {
            Effect = "Allow",
            Action = "logs:CreateLogGroup",
            Resource = "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:*"
        },
        {
            Effect = "Allow",
            Action = [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            Resource = [
                "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/*"
            ]
        }
    ]
  })
}

# --- 5. Attach Policy to Lambda Role ---
resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# --- 6. EC2 Web Server Execution Role ---
resource "aws_iam_role" "web_server_role" {
  name        = var.web_server_role_name
  description = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# --- 7. Attach Pass-Through Access Roles ---
resource "aws_iam_user_policy_attachment" "admin_attach" {
  user       = aws_iam_user.admin_user.name
  policy_arn = var.database_user_policy_arn
}