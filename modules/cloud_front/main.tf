resource "aws_cloudfront_distribution" "cdn" {
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  aliases = var.domain_aliases

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = var.origin_id
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
    compress = true
  }

  origin {
    domain_name = var.bucket_endpoint
    origin_id = var.origin_id
    s3_origin_config {
      origin_access_identity = var.origin_access_identity
    }
  }

  custom_error_response {
    error_code          = 403
    response_page_path  = "/error.html"
    response_code       = 404
  }

  custom_error_response {
    error_code          = 404
    response_page_path  = "/error.html"
    response_code       = 404
  }

  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
      locations = var.geo_restriction_locations
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}