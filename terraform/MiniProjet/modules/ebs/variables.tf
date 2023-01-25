variable "size" {
  type        = number
  description = "set EBS size"
  default     = 1
}

variable "ebs_common_tag" {
  type        = map(any)
  description = "set ebs tag"
  default = {
    Name = "ebs_volume"
  }
}