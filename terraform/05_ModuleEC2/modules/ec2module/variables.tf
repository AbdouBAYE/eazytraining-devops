variable "instancetype" {
  type        = string
  description = "set aws instance tag"
  default     = "t2.nano"
}

variable "sg_name" {
  type        = string
  description = "set security group name"
  default     = "abdoulaye-sg"
}


variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "ec2-abdoulayedevops"
  }
}