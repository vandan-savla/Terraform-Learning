output "apache2_web_sg_id" {
  value = aws_security_group.apache2_web_sg.id

}

output "apache2_web_host_public_ip" {
  value = aws_instance.apache_web_host.public_ip
}
