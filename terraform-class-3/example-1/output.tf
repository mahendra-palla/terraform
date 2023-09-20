output "public_ip" {
    description = "provide public IP of ec2 instance"
    value = aws_instance.application.public_ip
}

output "instance_vpc" {
    value = aws_instance.application.vpc_security_group_ids
}

output "instance" {
    value = aws_instance.application.instance_lifecycle
  
}

output "instance-1" {
    value = aws_instance.application.security_groups
  
}