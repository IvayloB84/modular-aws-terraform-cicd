# --- 1. Data Retrieval ---
data "aws_secretsmanager_secret" "db_pass" {
  arn = var.secrets_manager_arn
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.db_pass.arn
}

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

# --- 2. Main RDS Cluster ---
resource "aws_rds_cluster" "db_cluster" {
  cluster_identifier     = var.cluster_identifier
  engine                 = var.engine_type
  engine_version         = var.engine_version
  master_username        = local.db_creds.username
  master_password        = local.db_creds.password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = var.vpc_security_group_ids
  availability_zones     = var.availability_zones

  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot
  apply_immediately       = var.apply_immediately

  lifecycle {
    create_before_destroy = false
  }

  tags = {
    Service     = "${var.cluster_identifier}-main-cluster"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# --- 3. Cluster Instance ---
resource "aws_rds_cluster_instance" "db_instance" {
  cluster_identifier           = aws_rds_cluster.db_cluster.id
  identifier                   = var.instance_identifier
  instance_class               = var.instance_class
  engine                       = aws_rds_cluster.db_cluster.engine
  engine_version               = aws_rds_cluster.db_cluster.engine_version
  db_subnet_group_name         = aws_db_subnet_group.db_subnet_group.name
  performance_insights_enabled = var.performance_insights_enabled
  
  tags = {
    Service     = "${var.cluster_identifier}-main-cluster"
    Environment = var.environment
    ManagedBy   = "terraform"
  }

  lifecycle {
    create_before_destroy = true
  }  
}

# --- 4. DB Subnet Group ---
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids 

  tags = {
    Service     = "${var.cluster_identifier}-subnet-group"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}