resource "aws_instance" "dev-server" {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    vpc_security_group_ids = ["${aws_security_group.SG-for-dev-server.id}"]
    availability_zone = "ap-south-1a"
    subnet_id = "${data.aws_subnet.stackorigin-subnet.id}"

    depends_on = [
        aws_security_group.SG-for-dev-server
     ]

    tags = {
      Name = "Dev-server-stackorigin"
    }
  
}


resource "aws_security_group" "SG-for-dev-server" {
    name = "dev-instance-security-group"
    description = "This security group attaches to DEV SERVERS"
    vpc_id = "${data.aws_vpc.stackorigin-vpc.id}"

    ingress {
        description = "Custion port for http"
        to_port = 80
        from_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "Allow SSH Access"
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    lifecycle {
      ignore_changes = [ tags ]
    }

    tags = {
        Name = "SG-for-dev-server"
    }
  
}