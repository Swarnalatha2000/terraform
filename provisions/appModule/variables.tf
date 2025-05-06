variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "security_group" {
  description = "Security Group ID for the EC2 instance but displayed as list in main file"
  type        = string
}

variable "key_name" {
  description = "Name of an existing EC2 Key Pair"
  type        = string
}

variable "private_key_path" {
  description = "Path to the corresponding private key file"
  type        = string
}
