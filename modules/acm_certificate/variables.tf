variable "wildcard_domain_name" {
  type        = string 
  description = "The main domain or wildcard address string mapping target (e.g., *.mycompany.net)"
}

variable "validation_method" {
  type        = string 
  description = "The certificate ownership validation framework methodology layer style type (e.g., DNS or EMAIL)"
}

variable "environment" {
  type        = string
  description = "The deployment runtime targeting profile tracks boundary label (dev or prod)"
}
