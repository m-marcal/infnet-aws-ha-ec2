provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"
  project_name = var.project_name
}

module "ec2" {
  source = "./modules/ec2"

  depends_on = [ module.network ]

  vpc_id = module.network.vpc_id
  
  # Public and Private subnets
  pub_subnets = module.network.public_subnet_ids
  private_subnets = module.network.private_subnet_ids

  # Security Groups
  security_group_id = module.network.instances_sg_id
  load_balancer_sec_group = module.network.alb_security_group
  bastion_sec_group = module.network.bastion_security_group

  TIMDb_API_KEY = var.TIMDb_API_KEY
}

# Unfortunately, this does not work with the Sandbox from 
# AWS Academy due to missing API permissions. 
#module "storage" {
#  source = "./modules/storage"
#
#  project_name = var.project_name
#}
