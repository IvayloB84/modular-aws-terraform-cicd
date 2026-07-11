variable "role_name" {
  type        = string
  description = "The name of the IAM execution role"
}

variable "target_s3_bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket this IAM role needs access to"
}