output "bastion_public_ip" {
    value = aws_instance.bastion_inst.public_ip
}