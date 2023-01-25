provider "aws" {
  region     = "us-east-1"
  shared_credentials_files = ["C:/Users/abdou/Documents/secret/aws_credentials"]
}

module "sg" {
  source = "../modules/sg"
  sg_name = "sg_app"
}

module "ebs" {
  source = "../modules/ebs"
  size  = 4
  ebs_common_tag = {
  Name = "ebs_app_volume"
 }
}

module "eip" {
  source = "../modules/eip"
}

module "ec2" {
  source = "../modules/ec2"
  instancetype = "t2.micro"
  public_ip = module.eip.eip_public_ip
  sg_name = module.sg.sg_name
  aws_common_tag = {
  Name = "ec2-app"
 }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.id_ebs
  instance_id = module.ec2.id_ec2
}

resource "aws_eip_association" "eip-ec2_association" {
  instance_id   = module.ec2.id_ec2
  allocation_id = module.eip.id_eip
}

#resource "aws_network_interface_sg_attachment" "sg_attachment" {
#  security_group_id    = module.sg.id_sg
#  network_interface_id = module.ec2.ec2_interface
#}
