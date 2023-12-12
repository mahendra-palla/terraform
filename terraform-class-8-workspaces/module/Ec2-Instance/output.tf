output "ami" {
    description = "Provide the private IP"
    value = aws_instance.Dev_env.private_ip
}

output "instance_public_ip" {
    description = "Provide public IP"
    value = aws_instance.Dev_env.public_ip
}

output "name" {
    value = aws_instance.Dev_env.availability_zone
  
}

output "name-1" {
    value = aws_instance.Dev_env.security_groups
  
}

output "name-2" {
    value = aws_instance.Dev_env.subnet_id
  
}

output "name-3" {
    value = aws_instance.Dev_env.ebs_optimized
}