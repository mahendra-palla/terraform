resource "aws_security_group" "jenkins_SG" {
  name        = "Jenkins-Server-Security-group"
  description = "This Security group is for Jenkins server"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = ""
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "jenkins_SG"
  }
}


resource "aws_instance" "Jenkins-server" {
  instance_type               = "t2.medium"
  ami                         = data.aws_ami.AMI.id
  vpc_security_group_ids      = [aws_security_group.jenkins_SG.id]
  subnet_id                   = data.aws_subnet.public-subnet.id
  availability_zone           = data.aws_availability_zones.azs.names[0]
  associate_public_ip_address = true
  key_name                    = "Key-Pair"
  user_data                   = file("jenkins-install.sh")



  tags = {
    Name = "Jenkins-Server"
  }


#We can also use below one

 /*  provisioner "remote-exec" {
    inline = [
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("key-Pair.pem")
    host        = self.public_ip
    }

  }

  depends_on = [
    aws_security_group.jenkins_SG
  ] */
}



resource "null_resource" "remote-exec" {
    provisioner "remote-exec" {
    inline = [
      "sleep 2m",
      "echo 'The initial jenkins password is:'",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]

    connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("key-Pair.pem")
    host        = aws_instance.Jenkins-server.public_ip
    }
}   
    depends_on = [ 
    aws_instance.Jenkins-server
    ]

}