# VPC
resource "aws_vpc" "vpc-network" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc-network"
  }
}

# Subnets
# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.vpc-network.id

  tags = {
    Name = "vpc-network-gw"
  }
}


# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc-network.id
  cidr_block              = var.public_subnets_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc-network.id
  cidr_block              = var.private_subnets_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = false

  tags = {
    Name        = "private-subnet"
  }
}

# Data Subnet
resource "aws_subnet" "data_subnet" {
  vpc_id                  = aws_vpc.vpc-network.id
  cidr_block              = var.private_data_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = false

  tags = {
    Name        = "data-subnet"
  }
}

# Elastic-IP (eip) for NAT
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet-gw]
}

# NAT
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name        = "nat"
  }
}

/*
resource "aws_network_acl" "net-acl" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "net-acl"
  }
