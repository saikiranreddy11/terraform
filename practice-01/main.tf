resource "aws_instance" "practice"{
    count = 10
    ami = data.aws_ami.amiId.image_id
    subnet_id = data.aws_subnet.selected.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    key_name  = aws_key_pair.key.key_name
    tags = {
        Name = var.instance_names[count.index]
    Environment = "Development"
    component       = "Database"
    }
}

resource "aws_security_group" "allow_all"{
    name = var.sg_name
    description = var.sg_description
    vpc_id = data.aws_vpc.vpc_id.id

    ingress {
    description      = "allowing all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

resource "aws_key_pair" "key" {
  key_name   = "sivakey"
  public_key = local.key_pair
}


resource "aws_route53_record" "example_a_record" {
    count = 10
  zone_id = "Z05570443S15P72O43ST7"  # Replace with your Route 53 hosted zone ID
  name    = "${var.instance_names[count.index]}.saikiransudhireddy.com"
  type    = "A"
  ttl     = "1"  # Optional: Time to Live (TTL) in seconds
  records = [aws_instance.practice[count.index].private_ip]  # Replace with your IPv4 address
}


# "mongodb","catalogue","cart","user","redis","mysql","shipping","rabbitmq","payment","web"

