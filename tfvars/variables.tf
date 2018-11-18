variable "aws_profile" {
  type    = "string"
  default = "vutoff-lab"
}

variable "key_name" {
  default = "rbank-vutoff-lab-eu-west-1"
}

variable "main_vars" {
  type = "map"

  default = {
    Terraform   = "True"
    env         = "lab"
    application = "vutoff"
    region      = "eu-west-1"
  }
}

variable "domains" {
  type = "map"

  default = {
    public = "vutoff.receipt-labs.com"
  }
}

variable "network_vars" {
  type = "map"

  default = {
    availability_zones = ["eu-west-1a", "eu-west-1b"]
    vpc_cidr           = ["10.250.0.0/16"]
  }
}
