resource "aws_security_group" "int_postgres_sg" {
  name        = "ext-postgres-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${data.terraform_remote_state.network_state.vpc_id}"

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "TCP"

    cidr_blocks = [
      "${var.network_vars["vpc_cidr"]}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
