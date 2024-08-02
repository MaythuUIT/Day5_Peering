
resource "aws_route_table" "public_rtb-vpc-a" {
  vpc_id = aws_vpc.vpc_A.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcA_igw.id
  }
  route {
    cidr_block                = "10.1.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.VPC_A_TO_VPC_B.id
  }

  route {
    cidr_block                = "10.1.2.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.VPC_A_TO_VPC_C.id
  }

  tags = { Name = "VPC_A_public_rtb" }
}


resource "aws_route_table" "public_rtb-vpc-b" {
  vpc_id = aws_vpc.vpc_B.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcB_igw.id
  }
  route {
    cidr_block                = "10.1.0.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.VPC_A_TO_VPC_B.id
  }



  tags = { Name = "VPC_B_public_rtb" }
}



resource "aws_route_table" "public_rtb-vpc-c" {
  vpc_id = aws_vpc.vpc_C.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcC_igw.id
  }

  route {
    cidr_block                = "10.1.0.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.VPC_A_TO_VPC_C.id
  }
  tags = { Name = "VPC_C_public_rtb" }
}

//adding route




#ROUTE TABLE ASSOCIATION 
resource "aws_route_table_association" "public_VPC_A" {
  subnet_id      = aws_subnet.public_VPC_A_subnet.id
  route_table_id = aws_route_table.public_rtb-vpc-a.id
}

resource "aws_route_table_association" "public_VPC_A-2nd" {
  subnet_id      = aws_subnet.public_VPC_A-2nd_subnet.id
  route_table_id = aws_route_table.public_rtb-vpc-a.id
}

resource "aws_route_table_association" "public_VPC_B" {
  subnet_id      = aws_subnet.public_VPC_B_subnet.id
  route_table_id = aws_route_table.public_rtb-vpc-b.id
}

resource "aws_route_table_association" "public_VPC_C" {
  subnet_id      = aws_subnet.public_VPC_C_subnet.id
  route_table_id = aws_route_table.public_rtb-vpc-c.id
}
