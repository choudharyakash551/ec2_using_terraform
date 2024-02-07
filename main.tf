provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "instance_security_group" {
  name = "instance_sg"
  description = "security group"
  ingress = {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  instance_type = var.aws_instance_type
  ami = data.aws_ami.ec2-ami.id
  key_name = var.aws_access_keys
  security_groups = aws_security_group.instance_security_group
}

data "aws_ami" "ec2-ami" {
  most_recent = true

  filter {
    name = "ec2"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [""]
}