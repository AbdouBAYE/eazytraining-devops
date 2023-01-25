data "aws_ami" "ubuntu-linux-1804" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.ubuntu-linux-1804.id
  instance_type   = var.instancetype
  availability_zone = "us-east-1e"
  key_name        = var.key_name
  tags            = var.aws_common_tag
  security_groups = ["${var.sg_name}"]

  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${var.public_ip} > ip_ec2.txt"
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
   ]

   connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("C:/Users/abdou/Documents/secret/devops-abdou.pem")
    host     = self.public_ip
   }
  }
} 