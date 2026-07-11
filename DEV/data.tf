## Existing AWS-managed instance policy for SSM manager for Bastion hosts instances in order to allow SSM-tunnel connection to our databases.
data "aws_iam_role" "ssm-manager-role" {
  name = "sis-ssm-role-for-terraform"
}

data "aws_iam_policy" "ssm-manager-policy" {
  arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

data "aws_iam_instance_profile" "ssm-manager-profile" {
  name = "sis-instance-profile-ssm"
}

data "aws_iam_instance_profile" "sis-dev-bastion-role" {
  name = "sis-dev-bastion-role"
}

data "aws_iam_instance_profile" "sis-dev-web-server-role" {
  name = "sis-dev-web-server-role"
}

data "aws_iam_policy" "DB-Aurora-User" {
  arn = "arn:aws:iam::914978342626:policy/DB-Aurora-User"
}

data "aws_iam_policy" "pdf-generation-dev-lambda-invoke-policy" {
  arn = "arn:aws:iam::914978342626:policy/pdf-generation-dev-lambda-invoke-policy"
}

data "aws_iam_policy" "sis-pdf-files-dev-s3-get-object-policy" {
  arn = "arn:aws:iam::914978342626:policy/sis-pdf-files-dev-s3-get-object-policy"
}

data "aws_iam_policy" "pdf-files-dev-s3-get-object-policy" {
  arn = "arn:aws:iam::914978342626:policy/pdf-files-dev-s3-get-object-policy"
}

data "aws_iam_role" "sis-ssm-role-for-terraform" {
  name = "sis-ssm-role-for-terraform"
}

data "aws_iam_role" "sis-dev-bastion-role" {
  name = "sis-dev-bastion-role"
}

data "aws_iam_role" "sis-dev-web-server-role" {
  name = "sis-dev-web-server-role"
}

data "aws_iam_role" "pdf-generation-dev-role-wdnryyl4" {
  name = "pdf-generation-dev-role-wdnryyl4"
}

data "aws_iam_group" "developers" {
  group_name = "Developers"
}

data "aws_iam_user" "sisadmin" {
  user_name = "sisadmin"
}

data "aws_lambda_function" "pdf-generation-dev" {
  function_name = "pdf-generation-dev"
}

data "aws_lambda_layer_version" "pdf-generation-packages" {
  layer_name = "pdf-generation-packages"
}

# data "aws_lambda_function_url" "pdf-generation-dev" {
#   function_name = "pdf-generation-dev"
# }