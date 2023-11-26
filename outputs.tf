output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "alb_dns" {
  description = "ALB DNS Record"
  value       = module.ec2.alb_dns
}

output "bastion_ip" {
  value = module.ec2.bastion_ip
}