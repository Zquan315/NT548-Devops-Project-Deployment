output "nhom16_vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.nhom16_vpc.id
}

output "nhom16_subnet_public_ids" {
  description = "The cidr of the public subnets"
  value       = [for subnet in aws_subnet.nhom16_subnet_public: subnet.id]
}

output "nhom16_subnet_private_ids" {
  description = "The cidr of the private subnets"
  value       = [for subnet in aws_subnet.nhom16_subnet_private: subnet.id]
  
}

output "nhom16_internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.nhom16_igw.id
  
}