data "aws_ssm_parameter" "vault_root_token" {
  name = "vault-vault.vutoff.receipt-labs.com-root-token"
}
