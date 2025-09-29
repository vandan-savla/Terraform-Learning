
resource "aws_instance" "apache_web_host" {
  ami           = "ami-0360c520857e3138f"
  instance_type = var.host_type
  key_name      = "ssh-key-pair-common"
  tags = {
    Name = "apache_web_host"
  }
  vpc_security_group_ids = [aws_security_group.apache2_web_sg.id]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./ssh-keys/ssh-key-pair-common.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

}

