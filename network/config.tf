terraform {
  required_version = "0.11.10"

  backend "s3" {
    bucket  = "vutoff-tfstate-eu-west-1"
    key     = "lab/stateful/terraform.tfstate"
    profile = "vutoff-lab"
    region  = "eu-west-1"
  }
}

# Configure Providers
provider "aws" {
  version = "1.41"
  region  = "${var.main_vars["region"]}"
  profile = "${var.aws_profile}"
}

provider "aws" {
  version = "1.41"
  region  = "${var.main_vars["region"]}"
  profile = "production"
  alias   = "production"
}

provider "template" {
  version = "1.0"
}
