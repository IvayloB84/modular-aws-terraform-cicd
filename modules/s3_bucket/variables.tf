variable "bucket_name" {
    type = string
    description = "The unique name of the S3 bucket"
}

variable "environment" {
    type = string
    description = "The deployment environment (e.g., dev, prod)"
}

variable "cloudfront_distribution_arn" {
  type        = string
  description = "The ARN of the CloudFront distribution allowed to read from this bucket"
  default     = null # Optional default to prevent breaking basic standalone buckets
}