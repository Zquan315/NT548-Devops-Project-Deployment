output "nhom16_nat_gateway_id" {
  description = "The ID of the NAT Gateway in zone A"
  value       = aws_nat_gateway.nhom16_nat_gateway.id
}

output "nhom16_eip_allocate_nat_gateway_id" {
  description = "The ID of the Elastic IP associated with the NAT Gateway"
  value       = aws_eip.nhom16_eip_allocate_nat_gateway.id
  
}
