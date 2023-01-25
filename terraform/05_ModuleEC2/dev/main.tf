module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.nano"
  aws_common_tag = {
  Name = "ec2-dev-abdoudevops"
}
  sg_name = "abdoulaye-dev-sg"
}