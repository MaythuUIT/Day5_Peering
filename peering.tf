//Peering between VPC A and VPC B

resource "aws_vpc_peering_connection" "VPC_A_TO_VPC_B" {
  vpc_id      = aws_vpc.vpc_A.id
  peer_vpc_id = aws_vpc.vpc_B.id
  auto_accept = true # Set to false if the peering connection needs to be accepted manually

  tags = {
    Name = "VPC_A_TO_VPC_B"
  }
}

# Define the VPC Peering Connection Accepter
resource "aws_vpc_peering_connection_accepter" "VPC_A_TO_VPC_B_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.VPC_A_TO_VPC_B.id
  auto_accept               = true # Automatically accept the peering connection

  tags = {
    Name = "VPC_A_TO_VPC_B"
  }
}


//Peering between VPC A and VPC C

resource "aws_vpc_peering_connection" "VPC_A_TO_VPC_C" {
  vpc_id      = aws_vpc.vpc_A.id
  peer_vpc_id = aws_vpc.vpc_C.id
  auto_accept = true # Set to false if the peering connection needs to be accepted manually

  tags = {
    Name = "VPC_A_TO_VPC_C"
  }
}

# Define the VPC Peering Connection Accepter
resource "aws_vpc_peering_connection_accepter" "VPC_A_TO_VPC_C_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.VPC_A_TO_VPC_C.id
  auto_accept               = true # Automatically accept the peering connection

  tags = {
    Name = "VPC_A_TO_VPC_C"
  }
}
