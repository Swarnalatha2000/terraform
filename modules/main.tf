provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "example" {
  ami = var.aws_ami
  instance_type = var.aws_instance_type
}

