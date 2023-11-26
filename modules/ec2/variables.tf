variable "ami_id" {
  description = "The AMI ID for Ubuntu 22.04 LTS"
  type        = string
  default     = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "The key name to use for the EC2 instance"
  type        = string
  default     = "vockey"
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
  type        = string
}

variable "load_balancer_sec_group" {
  description = "The ID of the security group to associate with the Application Load Balancer"
  type        = list(string)
}

variable "bastion_sec_group" {
  description = "Bastion sec group"
}

variable "project_name" {
  description = "The project name to be used as a prefix for resources"
  type        = string
  default     = "infnet"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "pub_subnets" {
  description = "The load balancer routes traffic to targets in these Availability Zones only"
  type        = list(string)  
}

variable "private_subnets" {
  description = "The load balancer routes traffic to targets in these Availability Zones only"
  type        = list(string)  
}

variable "TIMDb_API_KEY" {
  description = "API Key for TIMDb"
  type        = string
}

variable "asg_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
  default     = 1
}