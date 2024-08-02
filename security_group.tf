resource "aws_security_group" "allow_all" {
  depends_on = [aws_vpc.vpc_A, aws_vpc.vpc_B, aws_vpc.vpc_C, aws_subnet.public_VPC_A_subnet, aws_subnet.public_VPC_B_subnet, aws_subnet.public_VPC_C_subnet]

  for_each = { for idx, vpc_id in local.vpc_ids : vpc_id => local.subnet_id[idx] }
  name     = "sgrp-${each.key}"
  vpc_id   = each.key

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "sgrp-${each.key}"
  }
}


locals {
  vpc_ids   = [aws_vpc.vpc_A.id, aws_vpc.vpc_B.id, aws_vpc.vpc_C.id]
  vpc_names = [aws_vpc.vpc_A.tags.Name, aws_vpc.vpc_B.tags.Name, aws_vpc.vpc_C.tags.Name]
}


