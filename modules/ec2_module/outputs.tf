output "nhom16_ec2_public_id" {
  value = aws_instance.nhom16_ec2_public.id
}

output "nhom16_ami_id" {
  value = aws_ami_from_instance.nhom16_ami.id
}