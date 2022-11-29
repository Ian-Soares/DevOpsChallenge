module "vpc" {
  source = "./modules/vpc"
  vpc_name = "vpc-prod-eks"

  vpc_cidr_block   = var.vpc_cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  tags    = var.tags_prod
  az_list = var.az_list
}

module "vpc_dev" {
  source = "./modules/vpc"
  vpc_name = "vpc-dev-containers"

  vpc_cidr_block   = var.vpc_cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  tags    = var.tags_dev
  az_list = var.az_list
}

module "k8s_sg" {
  source = "./modules/k8s_sg"

  vpc_id            = module.vpc.vpc_id
  vpc_cidr_block    = var.vpc_cidr_block
  allow_inbound_cpl = var.allow_inbound_cpl
  allow_inbound_ng  = var.allow_inbound_ng
}