module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
  Name = "ec2-prod-abdoudevops"
}
  sg_name = "abdoulaye-prod-sg"
}