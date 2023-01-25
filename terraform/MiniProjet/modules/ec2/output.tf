
output "id_ec2" {
  value = aws_instance.myec2.id
}

output "ec2_interface" {
  value = aws_instance.myec2.primary_network_interface_id
}
