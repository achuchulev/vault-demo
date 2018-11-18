module "vutoff_receipt_labs_com" {
  source         = "github.com/vutoff/tf-acm-module-aws.git"
  main_vars      = "${var.main_vars}"
  public_zone_id = "${aws_route53_zone.public_domain.id}"
  domain_name    = "*.${var.domains["public"]}"

  subject_alternative_names = [
    "${var.domains["public"]}",
  ]

  providers = {
    aws = "aws"
  }
}
