# Allocate an Elastic IP
resource "aws_eip" "nhom16_eip_zone_a" {
    network_border_group = var.region_network_border_group
    tags = {
        Name = "nhom16_eip-zone_a"
    }
}
resource "aws_eip" "nhom16_eip_zone_b" {
    network_border_group = var.region_network_border_group
    tags = {
        Name = "nhom16_eip_zone_b"
    }
}

# NAT Gateway
resource "aws_nat_gateway" "nhom16_nat_gateway_zone_a" {
    allocation_id     = var.nat_gateway_allocation_id_zone_a
    subnet_id         = var.nat_gateway_subnet_id_zone_a
    connectivity_type = var.nat_gateway_connectivity_type
    tags = {
        Name = "nhom16_nat_gateway-zone-a"
    }
}

resource "aws_nat_gateway" "nhom16_nat_gateway_zone_b" {
    allocation_id     = var.nat_gateway_allocation_id_zone_b
    subnet_id         = var.nat_gateway_subnet_id_zone_b
    connectivity_type = var.nat_gateway_connectivity_type
    tags = {
        Name = "nhom16_nat_gateway-zone-b"
    }
}