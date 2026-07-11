variable "iam_group_name" {
  type        = string
  description = "Friendly name for developers group"
}

variable "iam_user_name" {
  type        = string
  description = "Friendly name for admin user target string resource entry"
}

variable "lambda_role_name" {
  type        = string
  description = "Execution role name string parameter pattern for processing runtime layers"
}

variable "pdf_files_bucket_arn" {
  type        = string
  description = "The target storage ARN for data processing files execution layers"
}

variable "pdf_templates_bucket_arn" {
  type        = string
  description = "The target storage template tracking reference ARN tracking maps block"
}

variable "aws_region" {
  type        = string
  description = "Primary target region deployment tracking block for operational logs"
}

variable "web_server_role_name" {
  type        = string
  description = "Compute deployment instance processing access role name string layout"
}

variable "database_user_policy_arn" {
  type        = string
  description = "The target AWS database administrative interaction permission layer ARN"
}

variable "environment" {
  type        = string
  description = "The baseline target infrastructure workspace deployment engine runtime track"
}
