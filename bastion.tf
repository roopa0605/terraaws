resource "aws_security_group" "bastion_ssh" {
  name        = "ssh-bastion"
  description = "Allow ssh to bastion"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "ssh ip addr"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sshbastion"
  }
}

resource "aws_instance" "bastion_inst" {
  ami           = var.bastion_ami_id
  instance_type = var.bastion_instance_type
  key_name = var.bastion_keypair_name
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.bastion_ssh.id]
  associate_public_ip_address = true
  root_block_device {
            volume_type = var.bastion_volume_type
            volume_size = var.bastion_volume_size
        }
    

    tags = {
    Name = "Terra"
  }
}

