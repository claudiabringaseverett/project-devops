provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "jenkins-server"{
    ami = "ami-0261755bbcb8c4a84"
    instance_type = "t2.micro"
    key_name = "new_key"
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}