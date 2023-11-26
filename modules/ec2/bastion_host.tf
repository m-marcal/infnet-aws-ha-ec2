
resource "aws_instance" "bastion_host" {
  ami           = var.ami_id
  instance_type = "t2.small"
  key_name      = var.key_name
  associate_public_ip_address = true
  security_groups = [var.bastion_sec_group]
  subnet_id = var.pub_subnets[0]

  user_data = base64encode("${data.template_file.init_data.rendered}")
  tags = {
    Name = "${var.project_name}-bastion-host"
  }
}