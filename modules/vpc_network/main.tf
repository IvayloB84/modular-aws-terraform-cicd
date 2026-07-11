# --- 1. Core VPC Container ---
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name        = "generic-${var.environment}-vpc"
    Service     = "generic-vpc"
    Environment = var.environment
  }
}

# --- 2. Internet Gateway ---
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "generic-${var.environment}-igw"
    Service     = "generic-igw"
    Environment = var.environment
  }
}

# --- 3. Public Route Table ---
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name        = "generic-${var.environment}-public_rt"
    Service     = "generic-${var.environment}-public_rt"
    Environment = var.environment
  }
}

# --- 4. Private Route Table ---
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "generic-${var.environment}-private-rds-rt"
    Service     = "private-rds_rt"
    Environment = var.environment
  }
}

# --- 5. Public Subnets & Associations ---
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.public_subnet_azs[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = "generic-${var.environment}-public-subnet-${count.index + 1}"
    Service     = "generic-public-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# --- 6. Private Subnets & Associations ---
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.private_subnet_azs[count.index]

  tags = {
    Name        = "generic-${var.environment}-private-subnet-${var.private_subnet_azs[count.index]}"
    Service     = "private-subnet-${var.private_subnet_azs[count.index]}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}