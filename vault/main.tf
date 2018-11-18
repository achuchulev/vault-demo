module "vault_server" {
  source             = "github.com/vutoff/tf-vault-module-aws.git"
  main_vars          = "${var.main_vars}"
  network_vars       = "${var.network_vars}"
  key_name           = "${var.key_name}"
  private_subnet_ids = ["${data.terraform_remote_state.network_state.private_subnet_ids}"]
  public_subnet_ids  = ["${data.terraform_remote_state.network_state.public_subnet_ids}"]
  ami_id             = "ami-0aebeb281fdee5054"
  ssl_certificate_id = "${data.terraform_remote_state.network_state.vault_certificate}"
  public_zone_id     = "${data.aws_route53_zone.public_domain.id}"

  service_vars = {
    service_name     = "vault"
    min_instances    = "1"
    max_instances    = "1"
    instance_type    = "t3.small"
    instance_storage = "10"
    ebs_optimized    = false
  }

  security_groups = [
    "${aws_security_group.ext_ssh_vault_sg.id}",
    "${aws_security_group.ext_vault_sg.id}",
  ]
}
