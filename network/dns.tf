data "aws_route53_zone" "receipt_labs_com" {
  name         = "receipt-labs.com."
  private_zone = false
  provider     = "aws.production"
}

resource "aws_route53_zone" "public_domain" {
  name = "${var.domains["public"]}"
}

resource "aws_route53_record" "vutoff_receipt_labs_com" {
  provider = "aws.production"
  zone_id  = "${data.aws_route53_zone.receipt_labs_com.zone_id}"
  name     = "${var.domains["public"]}"
  type     = "NS"
  ttl      = 300
  records  = ["${aws_route53_zone.public_domain.name_servers}"]
}
