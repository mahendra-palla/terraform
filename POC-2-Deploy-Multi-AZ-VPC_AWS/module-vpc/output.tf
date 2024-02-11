output "vpc-id" {
  value = aws_vpc.mycompany.id


}

output "mycompany-IGW" {
  value = aws_internet_gateway.mycompany-IGW.id

}

output "mycompany-public-route-table" {
  value = aws_route_table.mycompany-public-route-table.id

}

output "mycompany-private-route-table" {
  value = aws_default_route_table.mycompany-private-route-table.id

}

output "public-subnets" {
  value = aws_subnet.mycompany-public-subnet[*].id
}
