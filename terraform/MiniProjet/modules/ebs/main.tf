resource "aws_ebs_volume" "ec2_volume" {
  availability_zone = "us-east-1e"
  size              = var.size
  tags = var.ebs_common_tag
}