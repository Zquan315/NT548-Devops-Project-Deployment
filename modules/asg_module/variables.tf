variable "ami_id" {
  description = "The AMI ID to use for the ASG instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the ASG instances."
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for SSH access to the ASG instances."
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "The IAM instance profile name for the ASG instances."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the ASG instances."
  type        = bool
  default     = true
}

variable "subnet_id_public" {
  description = "The public subnet ID for the ASG instances."
  type        = string
}

variable "security_group_id_public" {
  description = "The security group ID for the ASG instances."
  type        = list(string)
}

variable "volume_size" {
  description = "The size of the EBS volume for the ASG instances."
  type        = number
}

variable "volume_type" {
  description = "The type of the EBS volume for the ASG instances."
  type        = string
}


variable "desired_capacity" {
  description = "The desired number of instances in the ASG."
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances in the ASG."
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the ASG."
  type        = number
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the ASG instances."
  type        = list(string)
}
variable "target_group_arns" {
  description = "The list of target group ARNs for the ASG instances."
  type        = list(string)
}