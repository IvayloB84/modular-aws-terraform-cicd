# --- 1. Global Local Declarations ---
locals {
  common_tags = {
    Project     = var.global_project_id
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# --- 2. Network Foundation Layer ---
module "vpc_network" {
  source = "../modules/vpc_network"

  cidr_block              = "172.31.0.0/16"
  enable_dns_hostnames    = true
  enable_dns_support      = true
  public_subnet_cidrs     = ["172.31.32.0/20", "172.31.16.0/20"]
  public_subnet_azs       = ["eu-central-1b", "eu-central-1a"]
  map_public_ip_on_launch = true
  private_subnet_cidrs    = ["172.31.96.0/20", "172.31.48.0/20", "172.31.64.0/20"]
  private_subnet_azs      = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  environment             = "dev"
}

module "network_security" {
  source      = "../modules/security_groups"
  vpc_id      = module.vpc_network.vpc_id 
  environment = "prod"
}

# --- 3. Global Security & Permissions Layer ---
module "global_iam_security" {
  source                    = "../modules/iam_global"
  iam_group_name            = "Developers"
  iam_user_name             = "generic-admin"
  lambda_role_name          = "pdf-generation-dev-role"
  pdf_files_bucket_arn      = module.dev_bucket.bucket_arn # Connected to your module below!
  pdf_templates_bucket_arn  = "arn:aws:s3:::generic-pdf-templates-dev"
  aws_region                = "eu-central-1"
  web_server_role_name      = "generic-dev-web-server-role"
  database_user_policy_arn  = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  environment               = "prod"
}

module "dev_iam_role" {
  source               = "../modules/iam"
  role_name            = "dev-lambda-execution-role"
  target_s3_bucket_arn = module.dev_bucket.bucket_arn
}

# --- 4. Edge & SSL Security Layer (us-east-1) ---
module "ssl_certificate" {
  source = "../modules/acm_certificate"
  providers = {
    aws = aws.aws_us_east_1 
  }
  wildcard_domain_name = "*.mycompany.net"
  validation_method    = "DNS"
  environment          = "prod"
}

# --- 5. Application Content Delivery & Storage Layer ---
module "dev_cdn" {
  source = "../modules/cloudfront"

  domain_name         = "dev.sis.amexis.net"
  s3_bucket_id        = "my-company-dev-application-data-bucket" # Pass the plain name string
  acm_certificate_arn = module.ssl_certificate.certificate_arn 
  environment         = "prod"
}

module "dev_bucket" {
  source      = "../modules/s3_bucket"
  bucket_name = "my-company-dev-application-data-bucket"
  environment = "prod"

  # Secure OAC Loop handshake connection
  cloudfront_distribution_arn = module.dev_cdn.cloudfront_distribution_arn
}

# --- 6. Routing Layer ---
module "dns_routing" {
  source = "../modules/route53"
  providers = {
    aws = aws.aws_us_east_1 
  }

  route53_name      = "mycompany.net"
  private_zone      = false
  api_domain_record = "dev-api.mycompany.net"
  type              = "A"
  ttl               = 300
  
  # PLACEHOLDER: Replace this string array with your real compute module output when you build it!
  records           = ["1.1.1.1"] 
}