variable "region" {
  type = string
  default = "ap-southeast-2"
}

variable "domainname" {
  description = "The domain name used for the app (and redirection to https)"
  type = string
}

variable "bucket_prefix" {
  description = "Prefix for the bucket to create"
  type = string
  default = ""
}

variable "bucket_name" {
  description = "The name of the bucket used as domain name of the app"
  type = string
}

variable "origin_identity_arn" {
  description = "A list of arn allowed to read from the bucket"
  type = list(string)
}

variable tags {
  description = "Tags for the S3 bucket"
  type = map(string)
  default = { Terraform = "true"}
}
