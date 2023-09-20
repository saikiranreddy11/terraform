data "aws_ami" "amiId"{
    most_recent = true
    owners = ["amazon"]
    filter{
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*.0-x86_64-gp2"]
    }
}

output "ami_id"{
    value = data.aws_ami.amiId.image_id
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc1-pubsubnet1"]
  }
}


output "subnet_id"{
    value = data.aws_subnet.selected.id
}

data "aws_vpc" "vpc_id" {
    default = false
    state = "available"
}

output "vpc"{
    value = data.aws_vpc.vpc_id.id
}
