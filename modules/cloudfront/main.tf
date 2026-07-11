# 1. Look up the official AWS Managed Caching Optimised policy cleanly
data "aws_cloudfront_cache_policy" "optimized" {
  name = "Managed-CachingOptimized"
}

# 2. Use modern OAC instead of old OAI or open custom origin web blocks
resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "${var.environment}-sis-oac"
  description                       = "Secure S3 access control for ${var.environment}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# 3. Create the streamlined CloudFront distribution
resource "aws_cloudfront_distribution" "this" {
  enabled             = true
  aliases             = [var.domain_name]
  http_version        = "http2and3"
  price_class         = "PriceClass_100"
  default_root_object = "index.html"

  origin {
    domain_name              = "${var.s3_bucket_id}.s3.eu-central-1.amazonaws.com"
    origin_id                = "S3-${var.s3_bucket_id}"
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-${var.s3_bucket_id}"
    compress               = true
    cache_policy_id        = data.aws_cloudfront_cache_policy.optimized.id
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  tags = {
    Project     = "sis"
    Environment = var.environment
    Service     = "cloudfront-distribution"
    ManagedBy   = "terraform"
  }
}