resource "aws_instance" "local"{
    ami = local.ami_id
    instance_type = local.instance_type
    key_name= aws_key_pair.mykey.key_name
    subnet_id = "subnet-0b8f5c1919e251bdc"
}

resource "aws_key_pair" "mykey" {
  key_name   = "siva-key"          # The name for your key pair
  public_key = local.key  # Path to the public key file
}
