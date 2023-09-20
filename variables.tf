variable "tags"{
    type = map
    default= {
        Name:"rabbitmq"
        Environment: "prod"
        Terraform: "true"
        Component: "Mongodb"
        Project: "Roboshop"

    }
}


variable "ami_id"{
    default ="ami-03265a0778a880afb"
}

variable "instance_type"{
    default="t2.micro"
}

variable "instance_name"{
    default="roboshop"
}