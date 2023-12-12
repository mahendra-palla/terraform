provider "aws" {
    region = var.region
}

resource "aws_instance" "Dev_env" {
    ami = var.ami
    instance_type = var.instance_type
}


