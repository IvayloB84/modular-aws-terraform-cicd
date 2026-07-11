variable "vpc_id" {
  type        = string
  description = "The target VPC ID where security groups will be created"
}

variable "environment" {
  type        = string
  description = "The target development environment stage layer tracking string"
}