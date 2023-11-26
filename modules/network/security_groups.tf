resource "aws_security_group" "load_balancer_sg" {
  name        = "${var.project_name}-sg-lb-webfrontend"
  description = "Security group for Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "HTTP traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg-lb-webfrontend"
  }
}

resource "aws_security_group" "instances_sg" {
  name        = "${var.project_name}-sg-app"
  description = "Security group for instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups      = [aws_security_group.bastion_sg.id]
  }

  ingress {
    description      = "HTTP traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups      = [aws_security_group.load_balancer_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "${var.project_name}-sg-app"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "${var.project_name}-sg-bastion"
  description = "SG for Bastion hosts"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg-bastion"
  }
}
