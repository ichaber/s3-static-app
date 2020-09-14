output "app_bucket_arn" {
  description = "The ARN of the app bucket"
  value = aws_s3_bucket.app_bucket.arn
}

output "app_regional_domainname" {
  description = "The S3 buckets regional specific domain name"
  value = aws_s3_bucket.app_bucket.bucket_regional_domain_name
}