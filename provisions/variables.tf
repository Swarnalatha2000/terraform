variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 Key Pair"
  type        = string
}

variable "private_key_path" {
  description = "Path to the corresponding private key file"
  type        = string
}
