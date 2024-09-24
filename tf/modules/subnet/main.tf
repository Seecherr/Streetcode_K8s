data "aws_availability_zones" "AZN" {}

resource "aws_subnet" "publicSubnet" {
  count = length(var.publicSubnetCIDR)
  cidr_block = var.publicSubnetCIDR
  map_public_ip_on_launch = true
  vpc_id = var.vpc_id
  availability_zone = data.aws_availability_zones.AZN.names[0]

  tags = {
    Name = "${var.environment}-publicSubnet-${count.index + 1}"
    AZ = data.aws_availability_zones.AZN.names[0]
    Environment = "${var.environment}-publicSubnet"
  }
}

resource "aws_internet_gateway" "internetGateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.environment}-internetGateway"
  }
}

resource "aws_route_table" "public_routetable" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGateway.id
  }

  tags = {
    Name = "${var.environment}-public_RouteTable"
  }
}

resource "aws_route_table_association" "public_routetableAssociation" {
  count = length(var.publicSubnetCIDR)
  subnet_id = aws_subnet.publicSubnet[count.index].id
  route_table_id = aws_route_table.public_routetable.id

  depends_on = [ aws_subnet.publicSubnet, aws_route_table.public_routetable]

}
