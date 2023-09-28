provider "aws" {
    region = "ap-south-1"
  
}


resource "aws_instance" "example" {
  count = var.create_instance ? 1 : 0

  ami           = "ami-05552d2dcf89c9b24"
  instance_type = "t2.micro"
}