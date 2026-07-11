# Modular AWS Terraform CI/CD Framework

A production-grade Infrastructure-as-Code (IaC) repository engineered to deploy and manage a scalable AWS architecture. This framework implements a modular, decoupled multi-environment layout (DEV and PROD) to eliminate configuration drift, maximize reusability, and isolate staging boundaries.

## Key Architectural Features

- **Strict Environment Isolation**: Physical structural segregation using independent DEV and PROD runtime tracks instead of shared workspace states.
- **Secure Origin Access Control (OAC)**: Modernized CloudFront-to-S3 integration that blocks public internet bucket access.
- **Dynamic Secret Injection**: Integrated AWS Secrets Manager decoding loops inside database layers to keep administrative passwords out of version control.
- **Zero-Drift Variables**: Elimination of default values in child blueprints to enforce explicit runtime variable declarations via environment tfvars files.

## Repository Layout

```text
modular-aws-terraform-cicd/
├── .gitignore              # Multi-layer recursive tracking filter rules
├── README.md               # Architecture and pipeline documentation
├── bitbucket-pipelines.yml # Multi-stage continuous deployment pipeline
├── modules/                # Reusable core blueprint infrastructure blocks
│   ├── acm_certificate/    # Global SSL automation mapping (us-east-1)
│   ├── cdn_distribution/   # Edge delivery network cache routing
│   ├── database_cluster/   # Automated Aurora PostgreSQL Serverless nodes
│   ├── lambda/             # Serverless execution logic and endpoint URL bridges
│   ├── route53/            # Dynamic public zone DNS routing maps
│   ├── security_groups/    # Network perimeter firewall layer definitions
│   └── vpc_network/        # Baseline core subnets framework (eu-central-1)
├── DEV/                    # Development lifecycle staging lane
│   ├── main.tf             # Environment module tracking execution blocks
│   ├── provider.tf         # Dedicated localized AWS provider anchors
│   └── terraform.tfvars    # Anonymized local development variable metrics
└── PROD/                   # Live production lifecycle lane
    ├── main.tf
    ├── provider.tf
    └── terraform.tfvars
```

## Continuous Integration & Deployment Pipeline

The architecture is backed by an automated orchestration pipeline defined in bitbucket-pipelines.yml. The process is divided into explicit build, package, and deployment stages.

### Application Deployment Workflow

The pipeline triggers automatically on commits to designated branch tracks:

1. **Backend Build Stage**: Compiles the service utilizing a .NET 10.0 LTS SDK container environment, packages the binary assets into a secure deploy.zip archive, and exposes the bundle as a pipeline artifact.
2. **Frontend Build Stage**: Pulls an optimized Node 22 LTS container to execute dependency resolution (npm install) and compiles the Angular frontend application utilizing ahead-of-time (AOT) compilation.
3. **Backend Publish Stage**: Interacts with AWS CodeDeploy using verified Atlassian pipeline integrations to handle high-availability application updates via automated S3 upload and deployment group coordination.
4. **Frontend Publish Stage**: Synchronizes the static assets to the frontend S3 distribution layer and executes a targeted AWS CloudFront cache invalidation to propagate updates to edge locations instantly.

### Manual Infrastructure Operations (IaC)

A custom manual control gate is exposed within the pipeline interface to safely run infrastructure changes:

- **Targeted Selection**: The user defines the target workspace directory (DEV or PROD).
- **Execution Actions**: Supports dry-run validations (terraform plan) or automated infrastructure deployment (terraform apply with auto-approval attributes).
- **Conditional Tracking**: Evaluates modifications inside specific directory paths to ensure infrastructure code is only processed when changes exist within modules or environment directories.

## Local Workspace Controls

To execute structural validation scans locally on your workstation, enter the targeted deployment track directory:

```bash
cd DEV/
terraform init
terraform validate
```
