variable "cidr" {
  description = "Cidr block for the main vpc of the Wordpress app infrastructure"
  type = string
  default = "10.0.0.0/16"
}

variable "environment" {
  default = "wordpress"
}

variable "vpc_id" {}
