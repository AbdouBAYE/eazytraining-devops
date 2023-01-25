output "id_sg" {
  value = aws_security_group.allow_ssh_http_https.id
}

output "sg_name" {
  value = aws_security_group.allow_ssh_http_https.name
}