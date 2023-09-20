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

# OUTPUT  FILE CAN BE IN VARIABLE.TF FILE OR CAN BE IN MAIN.TF FILE 
#output "public_ip" {
#    description = "provide public IP of ec2 instance"
#    value = aws_instance.webserver.public_ip
#}