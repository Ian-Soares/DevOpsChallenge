data "aws_elb" "cluster_lb" {
  name = var.lb_name
}

data "aws_route53_zone" "primary" {
  name         = "iansoares.tk."
  private_zone = false
}
