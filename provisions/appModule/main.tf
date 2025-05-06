resource "aws_instance" "app-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group]
  key_name      = var.key_name
  associate_public_ip_address = true

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ec2-user/app.py"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = aws_instance.app-server.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo printing the app.server.py"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y python3",
      "sudo yum install python3-pip -y",
      "sudo pip3 install flask",
      "sudo python3 /home/ec2-user/app.py > /home/ec2-user/app.log &"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
