output "private_ips"{
    value = aws_instance.session2-instance[*].private_ip
}