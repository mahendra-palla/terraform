resource "aws_db_instance" "replica-postgresql-rds" {
  instance_class       = "db.t3.micro"
  skip_final_snapshot  = true
  backup_retention_period = 7
  replicate_source_db = aws_db_instance.postgresql-rds.identifier
  availability_zone = "ap-south-1b"

  tags = {
    Name = "GitLab-replica-db"
  }
}



