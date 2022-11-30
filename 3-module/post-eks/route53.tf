resource "aws_route53_record" "cluster" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "cluster.iansoares.tk"
  type    = "A"

  alias {
    name                   = data.aws_elb.cluster_lb.dns_name
    zone_id                = data.aws_elb.cluster_lb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "appc" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "appc.iansoares.tk"
  type    = "A"

  alias {
    name                   = data.aws_elb.cluster_lb.dns_name
    zone_id                = data.aws_elb.cluster_lb.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "appd" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "appd.iansoares.tk"
  type    = "A"

  alias {
    name                   = data.aws_elb.cluster_lb.dns_name
    zone_id                = data.aws_elb.cluster_lb.zone_id
    evaluate_target_health = true
  }
}
