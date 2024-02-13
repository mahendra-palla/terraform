output "rds-url" {
  value = aws_db_instance.postgresql-rds.endpoint
}


output "replica-url" {
  value=aws_db_instance.replica-postgresql-rds.endpoint
}