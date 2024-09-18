provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_id = module.vpc.vpc_id
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  environment = module.vpc.environment
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  environment = module.vpc.environment
}

module "ec2" {
  source = "./modules/ec2"
  publicSubnetCIDR = module.subnet.publicSubnetCIDR
  vpc_security_group_ids = module.sg.securityGroupIds
  subnet_id = module.subnet.subnetId
}



