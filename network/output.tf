output "vpc_id" {
  value = "${module.network.vpc_id}"
}

output "private_subnet_ids" {
  value = ["${module.network.private_subnet_ids}"]
}

output "k8s_private_subnet_ids" {
  value = ["${module.network.k8s_private_subnet_ids}"]
}

output "private_routing_ids" {
  value = ["${module.network.private_routing_ids}"]
}

output "public_subnet_ids" {
  value = ["${module.network.public_subnet_ids}"]
}

output "public_routing_ids" {
  value = ["${module.network.public_routing_ids}"]
}

output "vault_certificate" {
  value = "${module.vutoff_receipt_labs_com.certificate_arn}"
}

output "private_rds_subnet" {
  value = "${module.network.private_rds_subnet}"
}
