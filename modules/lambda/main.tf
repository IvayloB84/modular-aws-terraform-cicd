# --- 1. Core Lambda Function ---
resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = var.role
  layers        = var.layers
  filename      = var.zip_file_path
  skip_destroy  = var.skip_destroy
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size

  tags = {
    Name        = var.function_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# --- 2. Lambda Function URL Endpoint ---
resource "aws_lambda_function_url" "lambda_url" {
  # FIX: Reference the local resource block directly to avoid a crash
  function_name      = aws_lambda_function.lambda.function_name
  authorization_type = var.authorization_type
  invoke_mode        = var.invoke_mode
}
