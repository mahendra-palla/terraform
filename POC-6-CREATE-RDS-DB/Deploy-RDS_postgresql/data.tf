

data "aws_subnets" "public-subnet" {
  filter {
    name   = "tag:Name"
    values = ["public"]
  }
}

data "aws_vpc" "default" {
    filter {
      name = "tag:Name"
      values = ["default"]
    }
  
}