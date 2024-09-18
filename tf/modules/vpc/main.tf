resource "aws_vpc" "vpc_main" {
  cidr_block = var.cidr


  tags = {
    name = "${var.environment}-vpc"
  }
}
