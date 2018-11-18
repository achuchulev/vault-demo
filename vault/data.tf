data "terraform_remote_state" "network_state" {
  backend = "s3"

  config = {
    bucket  = "vutoff-tfstate-eu-west-1"
    key     = "lab/stateful/terraform.tfstate"
    profile = "vutoff-lab"
    region  = "eu-west-1"
  }
}

data "aws_route53_zone" "public_domain" {
  name = "vutoff.receipt-labs.com"
}
