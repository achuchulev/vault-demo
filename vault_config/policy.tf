# Enable Github authentitaction backend
resource "vault_auth_backend" "github" {
  type = "github"
}

# Add policy
resource "vault_policy" "grant_all" {
  name   = "grant-all"
  policy = "${file("policies/grant-all.hcl")}"
}

# Configure github auth
resource "vault_generic_secret" "github_config" {
  path = "auth/github/config"

  data_json = <<EOT
{
  "organization": "receipt-bank"
}
EOT

  lifecycle {
    ignore_changes = ["data_json"]
  }
}

resource "vault_generic_secret" "github_config_team" {
  path = "auth/github/map/teams/infrastructure"

  data_json = <<EOT
{
  "value": "grant-all"
}
EOT

  lifecycle {
    ignore_changes = ["data_json"]
  }
}
