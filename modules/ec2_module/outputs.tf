output "nhom16_ec2_public_id" {
  value = aws_instance.nhom16_ec2_public.id
}

output "nhom16_eip_id" {
  value = aws_eip.nhom16_eip.id
}