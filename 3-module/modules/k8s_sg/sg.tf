locals {
  ports_cpl = var.allow_inbound_cpl
  ports_ng  = var.allow_inbound_ng
}

resource "aws_security_group" "control_plane_security_group" {
  name        = "control_plane_security_group"
  description = "Allow rules for eks control plane"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = toset(local.ports_cpl)
    content {
      description = ""
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "control_plane_security_group"
  }
}

resource "aws_security_group" "node_group_security_group" {
  name        = "node_group_security_group"
  description = "Allow rules for eks node group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = toset(local.ports_ng)
    content {
      description = "Allow ports from any"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "node_group_security_group"
  }
}