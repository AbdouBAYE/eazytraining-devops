variable "instancetype" {
  type        = string
  description = "set aws instance tag"
  default     = "t2.nano"
}

variable "key_name" {
  type        = string
  description = "key name"
  default     = "devops-abdou"
}


variable "aws_common_tag" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "ec2-abdoulayedevops"
  }
}

variable "public_ip" {
  type        = string
  description = "ip public"
  default     = "NULL"
}

variable "sg_name" {
  type        = string
  description = "ip public"
  default     = "NULL"
}


