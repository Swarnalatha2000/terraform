provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/"
  aws_ami = "ami-0e449927258d45bc4"
  aws_instance_type = "t2.micro"
}
