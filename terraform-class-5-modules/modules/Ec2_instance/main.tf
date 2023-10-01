#Here we learn MODULES



resource "aws_instance" "Dev_env" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    availability_zone = var.availability_zone_value
    subnet_id = var.subnet_id_value

    tags = {
        Name = var.Instance_TAG
    }

  
}