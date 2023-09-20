provider "aws" {
    region = "ap-south-1"
}


resource "aws_instance" "webserver" {
    ami = var.ami-id
    instance_type = var.instance
    availability_zone = "ap-south-1a"
    tags = {
        Name = "webserver"
    } 
}
