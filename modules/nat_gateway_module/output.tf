output "nhom16_nat_gateway_allocation_id_zone_a" {
  description = "The allocation ID of the Elastic IP for zone A"
  value       = aws_eip.nhom16_eip_zone_a.id
}

output "nhom16_nat_gateway_allocation_id_zone_b" {
  description = "The allocation ID of the Elastic IP for zone B"
  value       = aws_eip.nhom16_eip_zone_b.id
  
}

output "nhom16_nat_gateway_id_zone_a" {
  description = "The ID of the NAT Gateway in zone A"
  value       = aws_nat_gateway.nhom16_nat_gateway_zone_a.id
}
output "nhom16_nat_gateway_id_zone_b" {
  description = "The ID of the NAT Gateway in zone B"
  value       = aws_nat_gateway.nhom16_nat_gateway_zone_b.id
}

