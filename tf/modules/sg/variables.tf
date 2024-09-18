variable "allowed_ports" {
  description = "Ports to open on the deployed instance"
  type = list(any)
  default = [ "443", "22", "80", "8080" ]
}

variable "vpc_id" {}
variable "environment" {}
