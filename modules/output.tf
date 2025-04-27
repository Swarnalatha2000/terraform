output "public_ip_address" {
  description = "prints public_ip"
  value = aws_instance.example.public_ip
}
