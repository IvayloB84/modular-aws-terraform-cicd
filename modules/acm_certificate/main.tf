terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_acm_certificate" "cert" {
  # Note: The provider line is completely removed from here!
  domain_name       = var.wildcard_domain_name
  validation_method = var.validation_method

  tags = {
    Project     = "generic-app"
    Environment = var.environment
    Service     = "website-cert"
    ManagedBy   = "terraform"
  }

  lifecycle {
    create_before_destroy = true
  }
}