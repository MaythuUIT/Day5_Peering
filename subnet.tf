
resource "aws_subnet" "public_VPC_A_subnet" {
  cidr_block        = "10.1.0.0/25"
  vpc_id            = aws_vpc.vpc_A.id
  availability_zone = "ap-southeast-1a"

  tags = { Name = "public_VPC_A_subnet" }
}

resource "aws_subnet" "public_VPC_B_subnet" {
  cidr_block        = "10.1.1.0/25"
  vpc_id            = aws_vpc.vpc_B.id
  availability_zone = "ap-southeast-1b"

  tags = { Name = "public_VPC_B_subnet" }
}

resource "aws_subnet" "public_VPC_C_subnet" {
  cidr_block        = "10.1.2.0/25"
  vpc_id            = aws_vpc.vpc_C.id
  availability_zone = "ap-southeast-1a"

  tags = { Name = "private_VPC_C_subnet" }
}

resource "aws_subnet" "public_VPC_A-2nd_subnet" {
  cidr_block        = "10.1.0.128/25"
  vpc_id            = aws_vpc.vpc_A.id
  availability_zone = "ap-southeast-1b"
  tags              = { Name = "public_VPC_A-2nd_subnet" }
}
