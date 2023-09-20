


variable "ami_id"{
    default ="ami-03265a0778a880afb"
}

variable "instance_type"{
    default="t2.micro"
}

variable "instance_name"{
    default= ["mongodb","catalogue","cart","user","redis","mysql","shipping","rabbitmq","payment","web"]
}

variable "zone_id"{
    default = "Z05570443S15P72O43ST7"
}

variable "domain"{
    default = "saikiransudhireddy.com"
}