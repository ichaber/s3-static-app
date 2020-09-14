locals {
    routing_rules = <<EOF
    EOF

}


resource "aws_s3_bucket" "app_bucket" {
    bucket = "${var.bucket_prefix}${var.bucket_name}"
    website {
        index_document = "index.html"
        error_document = "error.html"

        routing_rules = local.routing_rules
    }

    acl = "private"

    tags = var.tags
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.app_bucket.arn}/*"]

    principals {
      type = "AWS"
      identifiers = var.origin_identity_arn
    }
  }
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.app_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_s3_bucket_object" "webapp" {
    acl = "private"
    key = "index.html"
    bucket = aws_s3_bucket.app_bucket.id
    source = "${path.module}/index.html"
    content_type = "text/html"
}