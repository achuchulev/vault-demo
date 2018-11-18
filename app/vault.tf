# Generate username and password and store them into vault
resource "random_string" "db_pass" {
  length  = 16
  special = false
}

resource "vault_generic_secret" "db_credentials" {
  path = "secret/rds"

  data_json = <<EOT
{
  "username": "dbuser",
  "password": "${random_string.db_pass.result}"
}
EOT
}

resource "vault_mount" "db" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend       = "${vault_mount.db.path}"
  name          = "postgres"
  allowed_roles = ["my-app"]

  postgresql {
    connection_url = "postgres://dbuser:${random_string.db_pass.result}@${aws_db_instance.db.address}:${aws_db_instance.db.port}/${aws_db_instance.db.name}"
  }

  lifecycle {
    ignore_changes = ["postgresql.0.connection_url"]
  }
}

resource "vault_database_secret_backend_role" "role" {
  backend             = "${vault_mount.db.path}"
  name                = "my-app"
  db_name             = "${vault_database_secret_backend_connection.postgres.name}"
  creation_statements = "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';"
  default_ttl         = 300
  max_ttl             = 3600
}
