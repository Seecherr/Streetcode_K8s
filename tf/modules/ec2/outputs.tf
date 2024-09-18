output "ec2_type" {
    value = aws_instance.wordpress[*].instance_type
}

output "ec2_public_ip" {
    value = aws_instance.wordpress[*].public_ip
}

output "ec2_ami" {
    value = aws_instance.wordpress[*].ami
}
