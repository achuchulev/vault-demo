resource "aws_db_instance" "db" {
  engine                 = "postgres"
  engine_version         = "10.3"
  instance_class         = "db.t2.small"
  allocated_storage      = 10
  storage_type           = "gp2"
  name                   = "appdatabase"
  db_subnet_group_name   = "${data.terraform_remote_state.network_state.private_rds_subnet[0]}"
  vpc_security_group_ids = ["${aws_security_group.int_postgres_sg.id}"]
  multi_az               = false
  username               = "dbuser"
  password               = "${random_string.db_pass.result}"
  skip_final_snapshot    = true
}
