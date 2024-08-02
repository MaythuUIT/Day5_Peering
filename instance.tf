
resource "aws_key_pair" "instance_key" {
  key_name   = "instance-key"
  public_key = file("id_rsa.pub")

}
locals {
  server_names = ["ServerA", "ServerB", "ServerC"]
}

resource "aws_instance" "instance" {
  depends_on = [aws_vpc.vpc_A, aws_vpc.vpc_B, aws_vpc.vpc_C, aws_subnet.public_VPC_A_subnet, aws_subnet.public_VPC_B_subnet, aws_subnet.public_VPC_C_subnet]


  for_each = { for idx, vpc_id in local.vpc_ids : vpc_id => local.subnet_id[idx] }

  ami                         = "ami-012c2e8e24e2ae21d"
  instance_type               = "t2.micro"
  subnet_id                   = each.value
  vpc_security_group_ids      = [aws_security_group.allow_all[each.key].id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.instance_key.key_name
  tags = {

    Name = "Server-${each.key}"
  }
}


resource "aws_instance" "instance_AC" {
  for_each                    = toset(local.vpc_A_id)
  ami                         = "ami-012c2e8e24e2ae21d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_VPC_A-2nd_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_all[each.key].id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.instance_key.key_name
  tags = {
    //  for_each = toset(["ServerA", "ServerAB", "ServerC"])
    Name = "Server AC"
  }
}

resource "aws_instance" "instance_AC_samesubnet" {
  for_each                    = toset(local.vpc_A_id)
  ami                         = "ami-012c2e8e24e2ae21d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_VPC_A_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_all[each.key].id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.instance_key.key_name
  tags = {
    //  for_each = toset(["ServerA", "ServerAB", "ServerC"])
    Name = "Server AC-SameSubnet"
  }
}

locals {
  instance_name = ["serverA", "ServerAB", "ServerC"]
}

locals {
  vpc_A_id = [aws_vpc.vpc_A.id]
}

locals {
  subnet_id = [aws_subnet.public_VPC_A_subnet.id, aws_subnet.public_VPC_B_subnet.id, aws_subnet.public_VPC_C_subnet.id]
}


