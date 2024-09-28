resource "aws_vpc" "srinu" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "srinu"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.srinu.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}