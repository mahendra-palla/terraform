
# This is the terraform script to deploy in Multi-Regions and Multi-Availability-zone

# AMIs are diff for different regions. you need to search AMIs for each regions




provider "aws" {
    alias = "dev-environment"
    region = "ap-south-1"
}

provider "aws" {
    alias = "production-environment"
    region = "ap-south-1"
}

resource "aws_instance" "dev_instance" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    provider = aws.dev-environment
    availability_zone = "ap-south-1a"    # this step is required to deploy instance in multi AZs
    tags = {
        Name = "Dev-ENVIRONMENT-server"
    }
  
}

resource "aws_instance" "Prod_instance" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1b" # this step is required to deploy instance in multi AZs
    provider = aws.production-environment
    tags = {
        Name = "Prod-Environmet-server"

    } 
}