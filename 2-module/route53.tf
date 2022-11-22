data "aws_route53_zone" "primary" {
  name         = "iansoares.tk."
  private_zone = false
}

resource "aws_route53_record" "serverless" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = var.site_domain
  type    = "A"

  alias {
    name                   = module.cloudfront.cf_domain_name
    zone_id                = module.cloudfront.cdn_hosted_zone_id
    evaluate_target_health = false
  }
}
