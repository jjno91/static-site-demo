resource "aws_cloudfront_distribution" "this" {
  enabled                = true
  viewer_protocol_policy = "redirect-to-https"

  origin {
    origin_id   = "this"
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "this"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}