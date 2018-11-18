module "network" {
  source          = "github.com/vutoff/tf-network-module-aws.git"
  main_vars       = "${var.main_vars}"
  network_vars    = "${var.network_vars}"
  rds_enabled     = true
  bastion_enabled = true

  bastion = {
    key_name    = "${var.key_name}"
    allowed_ips = "87.121.146.7/32"
  }
}
