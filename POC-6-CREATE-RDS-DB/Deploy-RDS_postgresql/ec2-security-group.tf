resource "aws_security_group" "ec2-sg" {
  name        = "ec2 sg"
  description = "the ec2 sg"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress {
    description      = "22 psql"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}
