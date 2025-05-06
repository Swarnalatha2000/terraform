provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpcMain" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC-main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpcMain.id

  tags = {
    Name = "GATEWAY-main"
  }
}

resource "aws_subnet" "subnetMain" {
  vpc_id     = aws_vpc.vpcMain.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "SUBNET-main"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpcMain.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  
  tags = {
    Name = "ROUTE-TABLE-main"
  }
}

resource "aws_route_table_association" "rtassociation" {
  subnet_id      = aws_subnet.subnetMain.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.vpcMain.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "appModule" {
  source           = "./appModule/"
  subnet_id        = aws_subnet.subnetMain.id
  security_group   = aws_security_group.web_sg.id
  key_name         = var.key_name
  private_key_path = var.private_key_path
  instance_type    = var.instance_type
  ami_id           = var.ami_id
}

