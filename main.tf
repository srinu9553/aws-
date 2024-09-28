resource "aws_vpc" "non-prod" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "non-prod"
  }
}

resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.non-prod.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "web"
  }
}

resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.non-prod.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "app"
  }
}

resource "aws_subnet" "db" {
  vpc_id     = aws_vpc.non-prod.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "db"
  }
}



resource "aws_route_table" "web" {
  vpc_id = aws_vpc.non-prod.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.non-prod.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
}

resource "aws_route_table" "db" {
  vpc_id = aws_vpc.non-prod.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
}


resource "aws_route_table_association" "web" {
  subnet_id      = aws_subnet.web.id
  route_table_id = aws_route_table.web.id
}

resource "aws_route_table_association" "app" {
  subnet_id      = aws_subnet.app.id
  route_table_id = aws_route_table.app.id
}

resource "aws_route_table_association" "db" {
  subnet_id      = aws_subnet.db.id
  route_table_id = aws_route_table.db.id
}


