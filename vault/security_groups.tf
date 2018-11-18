resource "aws_security_group" "ext_ssh_vault_sg" {
  name        = "ext-ssh-vault-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${data.terraform_remote_state.network_state.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ext_vault_sg" {
  name        = "ext-vault-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${data.terraform_remote_state.network_state.vpc_id}"

  ingress {
    from_port   = 8200
    to_port     = 8201
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
