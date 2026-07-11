output "bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "The name/ID of the bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the bucket"
}
