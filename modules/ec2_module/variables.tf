variable "ami_id" {
  type        = string
  description = "AMI ID to launch the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}



variable "key_name" {
  type        = string
  description = "The name of the SSH key pair used to connect"
}

variable "subnet_id_public" {
  type        = string
  description = "The public subnet in which to launch the EC2 instance"
}

variable "security_group_id_public" {
  type        = list(string)
  description = "The security group ID associated with the EC2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address with the instance"
  default     = true
}

variable "region_network_border_group" {
  description = "The network border group for the Elastic IP address."
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "The name of the IAM instance profile to associate with the EC2 instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
}

variable "volume_type" {
  description = "Type of the root volume"
  type        = string
}
variable "ec2_tag_name" {
  description = "Tag name for the EC2 instance"
  type        = string 
}