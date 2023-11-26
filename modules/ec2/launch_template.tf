resource "aws_launch_template" "ec2_launch_template" {
  name_prefix   = "${var.project_name}-launch-template-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = base64encode("${data.template_file.init_data.rendered}")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-ec2-instance"
    }
  }
}