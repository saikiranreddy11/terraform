resource "aws_security_group" "allow_ssh_HTTP_HTTPS" {
  name        = "allow the required traffic"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-09bc63a334750870d"

  dynamic "ingress" {
    for_each = var.ingre
    content{
    description      = ingress.value["description"]
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"]
    
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}