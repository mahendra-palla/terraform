data "aws_vpc" "stackorigin-vpc" {
    
    filter {
      name = "tag:Name"
      values = ["stackorigin-vpc"]
      }
  
}

data "aws_subnet" "stackorigin-subnet" {

    filter {
        name = "tag:Name"
        values = ["stackorigin-subnet-public1-ap-south-1a"]
    }
  
}