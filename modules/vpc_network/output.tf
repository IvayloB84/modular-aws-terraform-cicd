output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The unique tracking string for the deployed VPC container network"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnets[*].id
  description = "The list array of all internal database network subnet ids"
}