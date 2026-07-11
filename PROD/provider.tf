terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }
}

#   backend "s3" {
#     bucket         = "your-unique-dev-tfstate-bucket" # Must be pre-created in AWS Console
#     key            = "dev/terraform.tfstate"         # Isolated path for DEV state
#     region         = "eu-central-1"                  # Store the state file in your primary region
#     encrypt        = true
#   }
# }

# Primary AWS Provider - Stands independently outside the terraform block
provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Project     = "enterprise-app"
      Environment = "prod"
      ManagedBy   = "terraform"
    }
  }
}

# Secondary AWS Provider for Global/Edge Resources (e.g., CloudFront, ACM)
provider "aws" {
  alias  = "aws_us_east_1"
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "enterprise-app"
      Environment = "prod"
      ManagedBy   = "terraform"
    }
  }
}