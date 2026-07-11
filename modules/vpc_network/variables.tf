# --- VPC Container Attributes ---
variable "cidr_block" {
  type        = string
  description = "The overarching address block spacing configuration layout allocation"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable assignment of public DNS strings to computing targets"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable query resolution system properties maps within VPC boundaries"
}

# --- Public Network Parameters ---
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Ordered array indexing map tracking sizes for public legs"
}

variable "public_subnet_azs" {
  type        = list(string)
  description = "Availability zone strings mapped to public layer components"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Automatically append public IPv4 pointers to launched compute devices"
}

# --- Private Network Parameters ---
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Ordered array indexing map tracking sizes for secure data isolation"
}

variable "private_subnet_azs" {
  type        = list(string)
  description = "Availability zone strings mapped to private storage nodes"
}

# --- Meta Controls ---
variable "environment" {
  type        = string
  description = "The target runtime layer lifecycle tracking indicator"
}
