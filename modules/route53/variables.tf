variable "domain_name" {
  description = "The domain name of the app"
  type = string
}

variable "cf_domain_name" {
  description = "The domain name information from cloudfront"
  type = string
}

variable "cf_hosted_zone_id" {
  description = "The hosted zone id information from cloudfront"
  type = string
}

variable tags {
  description = "Tags for the Route53 zone"
  type = map(string)
  default = { Terraform = "true"}
}
