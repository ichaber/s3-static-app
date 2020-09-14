resource "aws_route53_zone" "main" {
  name = var.domain_name
  comment = "Managed by Terraform"

  tags = var.tags
}

resource "aws_route53_record" "main_a_record" {
  zone_id = aws_route53_zone.main.zone_id
  name = var.domain_name
  type = "A"

  alias {
    name = var.cf_domain_name
    zone_id = var.cf_hosted_zone_id
    evaluate_target_health  = false
  }
}

resource "aws_route53_record" "main_cname_record" {
  zone_id = aws_route53_zone.main.zone_id
  name = "www"
  type = "CNAME"
  ttl = "600"

  records = [var.domain_name]
}