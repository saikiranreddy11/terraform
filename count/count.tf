resource "aws_instance" "session2-instance"{
    count =10 
    ami = var.ami_id
    #instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql"  ? "t3.micro" :"t2.micro"
    instance_type = "t2.micro"
    subnet_id ="subnet-040f6670554a3b8f2"
    key_name = aws_key_pair.mykey.key_name
    tags = {
        Name = var.instance_name[count.index]

    }
}



resource "aws_route53_record" "record" {
    count = 10
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.session2-instance[count.index].private_ip] 
}

resource "aws_key_pair" "mykey" {
  key_name   = "siva-key"          # The name for your key pair
  public_key = file("${path.module}/siva-key.pub")  # Path to the public key file
}


# "mongodb","catalogue","cart","user","redis","mysql","shipping","rabbitmq","payment","web"