variable "cidr_block_value" {
    description = "value of the CIDR block for the VPC."
    type        = string
}

variable "dns_hostnames_value" {
    description = "Enable or disable DNS hostnames for the VPC."
    type        = bool
    default     = true
  
}

variable "dns_support_value" {
    description = "Enable or disable DNS support for the VPC."
    type        = bool
    default     = true
}

variable "subnet_count_value" {
    description = "The number of subnets to create."
    type        = number
}

variable "cidr_block_private_value" {
    description = "The CIDR block for the subnets."
    type        = list(string)
}
variable "cidr_block_public_value" {
    description = "The CIDR block for the subnets."
    type        = list(string)
}

variable "map_public_ip_on_launch_private_value" {
    description = "Enable or disable mapping public IP addresses on launch."
    type        = bool
    default     = false
}
variable "map_public_ip_on_launch_public_value" {
    description = "Enable or disable mapping public IP addresses on launch."
    type        = bool
    default     = true
}

variable "availability_zone_private_value" {
    description = "The availability zones for the private subnets."
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]
}
variable "availability_zone_public_value" {
    description = "The availability zones for the public subnets."
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]
}
