provider "aws" {

  alias  = "prod"
  region = "ap-south-1"

}


resource "aws_instance" "Nginx-prod-server" {

  ami           = "ami-05552d2dcf89c9b24"
  instance_type = "t2.micro"


  tags = {
    Name = "Nginx-prod-server"
  }

  user_data = <<-EOF
		#! /bin/bash
                sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF

}

output "public_ip" {
    value = aws_instance.Nginx-prod-server.public_ip
  
}