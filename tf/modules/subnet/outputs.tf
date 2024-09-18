output "publicSubnetCIDR" {
  value = var.publicSubnetCIDR
}

output "subnetId" {
  value = aws_subnet.publicSubnet[0].id
}
