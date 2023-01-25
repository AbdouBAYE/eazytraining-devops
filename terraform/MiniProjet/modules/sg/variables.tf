variable "sg_name" {
  type        = string
  description = "set aws security group"
  default     = "abdoulaye_sg"
}

variable "public_ip" {
  type        = string
  description = "ip public"
  default     = "NULL"
}