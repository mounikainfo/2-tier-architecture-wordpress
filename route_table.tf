# route table creation

resource "aws_route_table" "infrastructure_route_table" {
  vpc_id = aws_vpc.infrastructure_vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tier_architecture_igw.id

  }
}

# route table association
resource "aws_route_table_association" "route-ec2-1-subnet-to-igw" {
  subnet_id      = aws_subnet.ec2_1_public_subnet.id
  route_table_id = aws_route_table.infrastructure_route_table.id

}

resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.ec2_2_public_subnet.id
  route_table_id = aws_route_table.infrastructure_route_table.id
}