output "certificate_arn" {
  value       = aws_acm_certificate.cert.arn
  description = "The ARN of the generated SSL certificate to cross-link with CloudFront"
}