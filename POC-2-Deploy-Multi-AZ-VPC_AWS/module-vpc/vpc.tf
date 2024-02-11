

resource "aws_vpc" "mycompany" {
  cidr_block           = var.cidr-block #variabled this cidr block
  enable_dns_hostnames = true           #when you create instance, you will see AWS automatically assign hostname to that instance
  enable_dns_support   = true

  tags = {
    Name = "mycompany-vpc"
  }
}


resource "aws_internet_gateway" "mycompany-IGW" {
  vpc_id = aws_vpc.mycompany.id

  tags = {
    Name = "mycompany-IGW"
  }

  depends_on = [
    aws_vpc.mycompany
  ]
}

resource "aws_route_table" "mycompany-public-route-table" {
  vpc_id = aws_vpc.mycompany.id

 

  tags = {
    Name = "mycompany-public-route-table"

  }
}

resource "aws_route" "public-route" {
    route_table_id = "aws_route_table.mycompany-public-route-table"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.mycompany-IGW"
}



resource "aws_default_route_table" "mycompany-private-route-table" {
  default_route_table_id = aws_vpc.mycompany.default_route_table_id

  tags = {
    Name = "mycompany-private-route-table"
  }
}

resource "aws_subnet" "mycompany-public-subnet" {
  count                   = length(var.public-cidrs)
  vpc_id                  = "aws_vpc.mycompany.id"
  cidr_block              = element(var.public-cidrs, count.index)
  map_public_ip_on_launch = true # This launch Public IPs t instance that scheduled on Public subnets
  availability_zone       = "data.aws_availability_zones.available.names[count.index]"

  tags = {
    Name = "mycompany-public-subnets.{count.index+1}"
  }
}

resource "aws_subnet" "mycompany-private-subnet" {
  count             = length(var.private-cidrs)
  vpc_id            = "aws_vpc.mycompany.id"
  cidr_block        = element(var.private-cidrs, count.index)
  availability_zone = "data.aws_availability_zones.available.names[count.index]"

  tags = {
    Name = "mycompany-Private-subnets.{count.index+1}"
  }
}


# Associate public subnet with public route table
resource "aws_route_table_association" "Public_subnet_Association-to-Public-route-table" {
  count          = length(var.public-cidrs)
  route_table_id = "aws_subnet.mycompany-public-subnet.id"
  subnet_id      = element(aws_subnet.mycompany-public-subnet.*.id, count.index)

  depends_on = [
    aws_route_table.mycompany-public-route-table,
    aws_subnet.mycompany-public-subnet,
    aws_route.public-route

  ]
}

# Associate private subnet with Private route table


resource "aws_route_table_association" "Private_subnet_Association-to-Private-route-table" {
  count          = length(var.private-cidrs)
  route_table_id = "aws_subnet.mycompany-private-subnet.id"
  subnet_id      = element(aws_subnet.mycompany-private-subnet.*.id, count.index)

  depends_on = [
    aws_default_route_table.mycompany-private-route-table,
    aws_subnet.mycompany-private-subnet

  ]
}

#security group creation INBOUND TRAFFIC - SSH & HTTP

resource "aws_security_group" "sg-for-mycompany" {
  name   = "mycompany-sg"
  vpc_id = "aws_vpc.mycompany"

  ingress {
    to_port     = 22
    from_port   = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port     = 80
    from_port   = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALL OUTBOUND Access

resource "aws_security_group_rule" "all-outbound-rule" {
  from_port         = 0
  to_port           = 0
  security_group_id = "aws_security_group.sg-for-mycompany"
  type              = "egress"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]

  depends_on = [
    aws_security_group.sg-for-mycompany
  ]

}









