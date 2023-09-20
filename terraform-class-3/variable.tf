variable "ami-id" {
    description = "this is te AMI used for AZ ap-south-1a"
    default = "ami-05552d2dcf89c9b24"
}

variable "instance" {
    description = "This is the EC2 Instance type using for AZ ap-south-1a"
    default = "t2.micro" 
}

output "public_ip" {
    description = "provide public IP of ec2 instance"
    value = aws_instance.webserver.public_ip
}