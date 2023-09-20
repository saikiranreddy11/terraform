locals {
    ami_id = "ami-03265a0778a880afb"
    key = file("${path.module}/siva-key.pub")
    instance_type =  var.instance_name == "local-instan" ? "t3.micro" :"t2.micro"

}