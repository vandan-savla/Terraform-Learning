
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
    tags = {
        "Name" = "main-vpc"
    }
    cidr_block = var.vpc_cidr
  
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    availability_zone = data.aws_availability_zones.available.names[0]
    tags = {
        "Name" = "public-subnet"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        "Name" = "private-subnet"
    }
}
resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        "Name" = "main-igw"
    }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}