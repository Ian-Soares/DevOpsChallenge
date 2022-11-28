resource "aws_route_table" "public_rt_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    var.tags,
    {
      Name = "public_rt_table"
  })
}

# resource "aws_route_table" "private_rt_table" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat_gw.id
#   }

#   tags = merge(
#     var.tags,
#     {
#       Name = "private_rt_table"
#   })
# }

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_rt_table.id
}

# resource "aws_route_table_association" "private" {
#   count = length(var.private_subnets)

#   subnet_id      = element(aws_subnet.private.*.id, count.index)
#   route_table_id = aws_route_table.private_rt_table.id
# }