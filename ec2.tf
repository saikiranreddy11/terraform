resource "aws_instance" "session2-instance"{
   # count =10 
    ami = var.ami_id
    instance_type = var.instance_name == "redis" ? "t3.micro" :"t2.micro"
   
    subnet_id = "subnet-0b8f5c1919e251bdc"
    #vpc_security_group_ids = [aws_security_group.allow_all.id]
    #vpc_security_group_ids = [aws_security_group.allow_all.id]
    #security_groups = [aws_security_group.allow_all.name]
    #vpc_id = var.my_vpc
    tags = var.tags
}

# "mongodb","catalogue","cart","user","redis","mysql","shipping","rabbitmq","payment","web"