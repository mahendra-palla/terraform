resource "aws_db_instance" "postgresql-rds" {
  allocated_storage    = 5
  db_name              = "funkymonkey"
  engine               = "postgres"
  engine_version       = "12.15"
  instance_class       = "db.t3.micro"
  username             = "gitlab"
  password             = "mahendra"
  skip_final_snapshot  = true
  # backup_retention_period = 7
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
 # db_subnet_group_name = data.aws_subnets.public-subnet.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "GitLab-prod_db"
  }
}
