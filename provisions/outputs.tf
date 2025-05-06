output "vpc_id" {
  value = aws_vpc.vpcMain.id
}

output "subnet_id" {
  value = aws_subnet.subnetMain.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}

output "instance_public_ip" {
  value = module.appModule.public_ip
}
