variable "global_project_id" {
  type        = string
  description = "The generic tracking name for the enterprise project assets"
}

variable "environment" {
  type        = string
  description = "The runtime tracking profile stage lane (e.g., prod)"
}

variable "project" {
  type        = string
  description = "The generic project tag identifier string"
  default     = "enterprise-app"
}

variable "domain_name" {
  type        = string
  description = "The production primary custom root domain name path mapping"
  default     = "mycompany.net"
}

variable "dev_domain_name" {
  type        = string
  description = "The development custom subdomain web app pathway"
  default     = "dev.mycompany.net"
}

variable "api_domain_name" {
  type        = string
  description = "The application backend custom service endpoint address"
  default     = "api.mycompany.net"
}

variable "wildcard_domain_name" {
  type        = string
  description = "The global wildcard target secure transport verification string mapping"
  default     = "*.mycompany.net"
}

variable "s3_domain_name" {
  type        = string 
  description = "The structural object storage hosting distribution edge reference path"
  # Clean production endpoint structure
  default     = "://amazonaws.com"
}

variable "domain_hosted_zone" {
  type        = string
  description = "The primary tracking global route domain hosted zone tracking map"
  default     = "mycompany.net"
}