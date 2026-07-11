# --- 1. Default Security Group ---
resource "aws_security_group" "default" {
  name        = "default"
  description = "default VPC security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "default security group for ${var.environment}"
    Service     = "main-db"
    Environment = var.environment
  }
}

# --- 2. Bastion Host Security Group ---
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "bastion-sg"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSL to VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound rule for HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound rule for PostgresSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Service     = "bastion host security group"
    Environment = var.environment
  }
}

# --- 3. Web App Server Security Group ---
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow traffic from web to RDS Aurora Serverless 2"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound rule for SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Inbound rule for HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Inbound rule for HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  egress {
    description = "HTTP to VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound rule for HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound rule for PostgresSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound rule for sending emails"
    from_port   = 587
    to_port     = 587
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Service     = "web-sg security group"
    Environment = var.environment
  } 
}

# --- 4. Private Subnet RDS Security Group ---
resource "aws_security_group" "private_subnet_rds_sg" {
  name        = "private-subnet-rds-sg"
  description = "Created by RDS management console"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Inbound rule for PostgresSQL from bastion-sg"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description     = "Inbound rule for PostgresSQL from web-sg"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    description     = "Outbound rule for PostgresSQL to bastion-sg"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    description     = "Outbound rule for PostgresSQL to web-sg"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  tags = {
    Service     = "private-subnet-rds-sg"
    Environment = var.environment
  }  
}