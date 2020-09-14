provider "aws" {
    version = "~> 2.0"
    region  = var.region
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {}

locals {
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "S3" {
  source = "./modules/static_S3"

  bucket_name = var.domainname
  bucket_prefix = var.bucket_prefix
  domainname = var.domainname

  tags = local.tags
  origin_identity_arn = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
}

module "CDN" {
  source = "./modules/cloud_front"

  domain_name = var.domainname
  origin_id = "cf-dist-${var.domainname}.s3.amazonaws.com"
  bucket_endpoint = module.S3.app_regional_domainname

  origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path

  tags = local.tags

}

module "Route53" {
  source = "./modules/route53"

  domain_name = var.domainname
  cf_domain_name = module.CDN.cdn_domain_name
  cf_hosted_zone_id = module.CDN.cdn_hosted_zone_id

  tags = local.tags
}