terraform {
  backend "s3" {
    bucket = "tfback"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
