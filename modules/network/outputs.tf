output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "instances_sg_id" {
  value = aws_security_group.instances_sg.id
}

output "alb_security_group" {
  value = [aws_security_group.load_balancer_sg.id]
  
}

output "bastion_security_group" {
  value = aws_security_group.bastion_sg.id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value = [for subnet in aws_subnet.private : subnet.id]
}

output "public_subnet_ids" {
  description = "List of IDs of private subnets"
  value = [for subnet in aws_subnet.public : subnet.id]
}