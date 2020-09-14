output "cdn_hosted_zone_id" {
  description = "The hosted zone id managed by cloudfront"
  value = aws_cloudfront_distribution.cdn.hosted_zone_id
}

output "cdn_domain_name" {
  description = "The domain name managed by cloudfront"
  value = aws_cloudfront_distribution.cdn.domain_name
}