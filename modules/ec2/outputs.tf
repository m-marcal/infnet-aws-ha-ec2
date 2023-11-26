output "ec2_launch_template_id" {
  description = "The ID of the EC2 launch template"
  value       = aws_launch_template.ec2_launch_template.id
}

output "alb_dns" {
  description = "App Load Balancer DNS record"
  value       = aws_lb.alb.dns_name
}

output "bastion_ip" {
  value = aws_instance.bastion_host.public_ip
}