terraform {
  required_version = "0.11.10"

  backend "s3" {
    bucket  = "vutoff-tfstate-eu-west-1"
    key     = "lab/vault_config/terraform.tfstate"
    profile = "vutoff-lab"
    region  = "eu-west-1"
  }
}

# Configure Providers
provider "aws" {
  version = " ~> 1.41"
  region  = "${var.main_vars["region"]}"
  profile = "${var.aws_profile}"
}

provider "vault" {
  address = "https://vault.vutoff.receipt-labs.com:8200"
  token   = "${data.aws_ssm_parameter.vault_root_token.value}"
}
