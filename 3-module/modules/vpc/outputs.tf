output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_pub_a_id" {
  value = aws_subnet.public[0].id
}

output "subnet_pub_b_id" {
  value = aws_subnet.public[1].id
}

output "subnet_priv_a_id" {
  value = aws_subnet.private[0].id
}

output "subnet_priv_b_id" {
  value = aws_subnet.private[1].id
}