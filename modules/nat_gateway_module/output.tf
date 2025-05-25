output "nhom16_nat_gateway_allocation_id" {
  description = "The allocation ID of the Elastic IP for zone A"
  value       = aws_eip.nhom16_eip.id
}



output "nhom16_nat_gateway_id" {
  description = "The ID of the NAT Gateway in zone A"
  value       = aws_nat_gateway.nhom16_nat_gateway.id
}


