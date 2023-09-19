provider "aws" {
    region = "ap-south-1"  
}

resource "aws_instance" "dev-env" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    tags = {
        Name = "Dev-ENVIRONMENT-server"
    }
  
}