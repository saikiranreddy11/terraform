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