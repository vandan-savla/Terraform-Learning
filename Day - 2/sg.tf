resource "aws_security_group" "apache2_web_sg" {
  name        = "apache2_web_sg"
  description = "apache2_web_sg"
  tags = {
    Name = "apache2_web_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "apache2_web_sg_ingress_ssh" {
  security_group_id = aws_security_group.apache2_web_sg.id
  cidr_ipv4         = "103.190.190.237/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "apache2_web_sg_ingress_http" {
  security_group_id = aws_security_group.apache2_web_sg.id
  cidr_ipv4         = "103.190.190.237/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "apache2_web_sg_egress_http" {
  security_group_id = aws_security_group.apache2_web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
