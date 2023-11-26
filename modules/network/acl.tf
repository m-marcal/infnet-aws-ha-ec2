# Access control lists for subnets
resource "aws_network_acl" "main_acl" {
  vpc_id = aws_vpc.main.id

  subnet_ids = local.private_and_pub_subnet_ids
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.project_name}-main-acl"
  }
}

# Since customization of ACLs is not necessary, I'm creating the following
#  list to accomodate all subnet ids. This is used above in the main ACL definition
locals {
  private_and_pub_subnet_ids =  concat([for subnet in aws_subnet.private : subnet.id], [for subnet in aws_subnet.public : subnet.id])
}