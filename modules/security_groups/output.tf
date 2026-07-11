output "private_rds_sg_id" {
  value       = aws_security_group.private_subnet_rds_sg.id
  description = "The ID of the RDS security group"
}

output "web_sg_id" {
  value       = aws_security_group.web_sg.id
  description = "The ID of the web service security group"
}