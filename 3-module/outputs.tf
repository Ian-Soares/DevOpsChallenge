output "vpc_id" {
  value = module.vpc.vpc_id
}

output "controlplane_sg_id" {
  value = module.k8s_sg.controlplane_sg_id
}

output "nodegroup_sg_id" {
  value = module.k8s_sg.nodegroup_sg_id
}

output "subnet_pub_a_id" {
  value = module.vpc.subnet_pub_a_id
}

output "subnet_pub_b_id" {
  value = module.vpc.subnet_pub_b_id
}

output "subnet_priv_a_id" {
  value = module.vpc.subnet_priv_a_id
}

output "subnet_priv_b_id" {
  value = module.vpc.subnet_priv_b_id
}