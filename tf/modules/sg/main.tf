resource "aws_security_group" "Security_Group_EC2Wordpress" {
  name = "Security Group for EC2 instances in wordpress vpc"
  vpc_id = var.vpc_id


  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-EC2-SG"
  }
}
