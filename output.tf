output "app_bucket_arn" {
  description = "The ARN of the bucket"
  value = module.S3.app_bucket_arn
}

output "cdn_domain_name" {
  description = "Domain name of the CF distribution"
  value = module.CDN.cdn_domain_name
}