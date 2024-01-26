resource "aws_instance" "dev-env" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"

    tags = {
      Name = "dev-environment-server"
    }
}

resource "aws_eip" "elastic_ip" {
    domain = "vpc" 
    instance = "aws_instance.dev-env"
}


# HERE, WE ARE IMPLICITLY CALLING THE EC2 INSTACE IN THE ELASTIC-IP BLOCK 