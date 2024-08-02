resource "aws_vpc" "vpc_A" {
  cidr_block = "10.1.0.0/24"

  tags = { Name = "vpc_A" }
}


resource "aws_vpc" "vpc_B" {
  cidr_block = "10.1.1.0/24"
  tags       = { Name = "vpc_B" }
}


resource "aws_vpc" "vpc_C" {
  cidr_block = "10.1.2.0/24"
  tags       = { Name = "vpc_C" }
}
