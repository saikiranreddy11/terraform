resource "aws_instance" "this" {
  for_each = var.instances
  ami                     = var.ami_id
  instance_type           =  each.value
  subnet_id = "subnet-040f6670554a3b8f2"
 tags  = {
    Name = each.key
    component = "roboshop"
    Envirnment = "dev"
 }
 
}

resource "aws_route53_record" "records" {
   for_each = var.instances
  zone_id = "Z05570443S15P72O43ST7"
  name    = "${each.key}.saikiransudhireddy.com"
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? aws_instance.this[each.key].public_ip : aws_instance.this[each.key].private_ip]
}