resource "aws_internet_gateway" "vpcA_igw" {
  vpc_id = aws_vpc.vpc_A.id

  tags = {
    Name = "VPCA_IGW"
  }
}

resource "aws_internet_gateway" "vpcB_igw" {
  vpc_id = aws_vpc.vpc_B.id

  tags = {
    Name = "VPCB_IGW"
  }
}


resource "aws_internet_gateway" "vpcC_igw" {
  vpc_id = aws_vpc.vpc_C.id

  tags = {
    Name = "VPCC_IGW"
  }
}

