provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""

}


data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  key_name        = "devops-abdou"
  tags            = var.aws_common_tag
  security_groups = ["${aws_security_group.allow_http_https.name}"]
}

resource "aws_security_group" "allow_http_https" {
  name        = "abdou-sg"
  description = "Allow http and https inbound traffic"

  ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}