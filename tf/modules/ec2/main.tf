resource "aws_instance" "wordpress" {
  count = 1
  ami = "ami-0adb0bcd85aef6f08"
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids.*.id

  user_data = file("./modules/ec2/confMachine.sh")

  tags = {
    Name = "Main wordpress node"
  }

}

