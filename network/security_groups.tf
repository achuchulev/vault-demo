resource "aws_security_group" "ext_ssh_bastion_sg" {
  name        = "ext-ssh-basion-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${module.network.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8472
    to_port     = 8472
    protocol    = "UDP"
    cidr_blocks = ["${var.network_vars["vpc_cidr"]}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
