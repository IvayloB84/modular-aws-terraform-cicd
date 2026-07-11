terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# --- 1. Data Source Lookup ---
data "aws_route53_zone" "hosted_zone" {
  name         = var.route53_name
  private_zone = var.private_zone
}

# --- 2. Route53 DNS Record ---
resource "aws_route53_record" "websiteurl" {
  # Note: The provider alias is passed from the environment call, not a variable attribute!
  name    = var.api_domain_record
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  type    = var.type
  ttl     = var.ttl
  records = var.records
}