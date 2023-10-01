


output "ami" {
    value = aws_instance.Dev_env.ami
  
}

output "dsplay_IAM-profile" {
    value = aws_instance.Dev_env.iam_instance_profile
  
}

output "AZ_NAME" {
    value = aws_instance.Dev_env.availability_zone
  
}

output "subnet-subnet_id" {
    value = aws_instance.Dev_env.subnet_id
  
}

output "private_ip" {
    value = aws_instance.Dev_env.private_ip
  
}

output "public_ip" {
    value = aws_instance.Dev_env.public_ip
  
}