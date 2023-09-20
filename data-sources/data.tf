data "aws_ami" "ami-data"{
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*.0-x86_64-gp2"]
    }
}

output "ami_id" {
    value = data.aws_ami.ami-data.id
}

data "aws_vpc" "example"{
    default = false
    state = "available"
} 

output "vpc"{
    value = data.aws_vpc.example.id
}