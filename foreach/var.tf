variable "ami_id"{
    default ="ami-03265a0778a880afb"
}


variable "instances"{
    type = map
    default = {
        web = "t2.micro"
        catalogue = "t2.micro"
        cart = "t2.micro"
        user = "t2.micro"
        shipping = "t2.micro"
        payment = "t2.micro"
        rabbitmq = "t2.micro"
        mongodb = "t3.medium"
        mysql = "t3.medium"
    }
}

variable "ingre"{
    type = list
    default = [{
    description      = "allowing the HTTPS traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    

    },
    {
    description      = "allowing the Http traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
    },
    {
    description      = "allowing the ssh traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
    }

]


}
