resource "aws_instance" "application" {
    ami = var.AMI
    instance_type = var.instance_type
    tags = {
      Name = var.tag
    }
  
}