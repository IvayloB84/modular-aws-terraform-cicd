variable "secrets_manager_arn" {
  type        = string
  description = "The ARN of the AWS Secrets Manager entry containing db credentials"
}

variable "identifier" {
  type        = string
  description = "The instance capacity size profile (e.g. db.t4g.medium)"
}

variable "cluster_identifier" {
  type        = string
  description = "Identifier for your RDS Cluster"
}

variable "instance_class" {
  type        = string
  description = "Identifier for your RDS Cluster"
}

variable "engine_type" {
  type        = string
  description = "Engine type for RDS Cluster"
}

variable "engine_version" {
  type        = string
  description = "Engine version of your cluster"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of the subnets"
}

variable "db_subnet_group_name" {
  type        = string 
  description = "Name of the group for the cluster"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "VPC security group ID"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of the availability zones"
}

variable "backup_retention_period" {
  type        = number
  description = "Backup retention period numeric in days"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot true or false"
}

variable "deletion_protection" {
  type        = bool
  description = "Protection if the backup can be deleted or not with Terraform"
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "The tags to be copied or not for the backup"
}

variable "apply_immediately" {
  type        = bool 
  description = "Apply immadeately the action or not"
}

variable "instance_identifier" {
  type        = string
  description = "Specify your preferred instance name identifier"
}

variable "performance_insights_enabled" {
  type = bool
  description = "Enable or disable performance insights tracking flags"
}

variable "environment" {
  type        = string
  description = "The target runtime infrastructure layer (dev or prod)"
}

