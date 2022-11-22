output "controlplane_sg_id" {
  value = aws_security_group.control_plane_security_group.id
}

output "nodegroup_sg_id" {
  value = aws_security_group.node_group_security_group.id
}