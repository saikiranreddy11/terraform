variable "sg_name"{
    default = "allowall"
}

variable "sg_description"{
    default = "This is to allow all traffic"
}

variable "instance_names" {
  type    = list
  default = ["mongodb","catalogue","cart","user","redis","mysql","shipping","rabbitmq","payment","web"]
}


# variable "instance_tags" {
#   type    = map
#   default = {
#     Name        = ["mongodb","catalogue","cart","user","redis","mysql","shipping","rabbitmq","payment","web"]
#     Environment = "Development"
#     component       = "Database"
#   }
# }
