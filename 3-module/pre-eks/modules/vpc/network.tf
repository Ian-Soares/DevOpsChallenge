resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}"
  })
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.az_list[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = "public_subnet"
  })
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = var.az_list[count.index]
  map_public_ip_on_launch = false
  tags = merge(
    var.tags,
    {
      Name = "private_subnet"
  })
}

resource "aws_subnet" "database" {
  count = length(var.database_subnets)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.database_subnets[count.index]
  availability_zone       = var.az_list[count.index]
  map_public_ip_on_launch = false
  tags = merge(
    var.tags,
    {
      Name = "database_subnet"
  })
}

