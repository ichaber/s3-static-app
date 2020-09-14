variable "region" {
  type = string
  default = "ap-southeast-2"
}

variable "domain_name" {
  description = "The domain name of the app"
  type = string
}

variable "domain_aliases" {
  description = "Aliases of the domain for the app"
  type = list(string)
  default = []
}

variable "bucket_endpoint" {
  description = "The app endpoint for the CF CDN (S3 bucket)"
  type = string
}

variable "origin_id" {
  description = "The origin ID used for the cloudfront distribution"
  type = string
}

variable "origin_access_identity" {
  description = "The OAI used to access the S3 bucket"
  type = string
}

variable "geo_restriction_type" {
  description = "Type of geo restricted countries (either black or whitelisted)"
  type = string
  default = "blacklist"
}

variable "geo_restriction_locations" {
  description = "List of geo restricted countries (either black or whitelisted)"
  type = list(string)
  default = ["RU", "KP"]
}

variable tags {
  description = "Tags for the Cloudfront distribution"
  type = map(string)
  default = { Terraform = "true"}
}
