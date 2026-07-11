variable "domain_name" {
  type        = string
  description = "The custom domain name for the distribution (e.g. dev.sis.amexis.net)"
}

variable "s3_bucket_id" {
  type        = string
  description = "The ID/Name of the target S3 bucket"
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of the SSL Certificate located strictly in us-east-1"
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)"
}