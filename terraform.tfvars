region_value  = "us-east-1"
profile_value = "quantc" #tài khoản ai người đó sử dụng 

# VPC
vpc_cidr_block_value         = "172.16.0.0/16"
vpc_cidr_block_private_value = ["172.16.1.0/24", "172.16.2.0/24"]
vpc_cidr_block_public_value  = ["172.16.3.0/24", "172.16.4.0/24"]
vpc_subnet_count_value = 2

#route table
destination_cidr_block_private_value = "0.0.0.0/0"
destination_cidr_block_public_value  = "0.0.0.0/0"

#security group private
from_port_in_private_value = 22
to_port_in_private_value   = 22
protocol_in_private_value  = "tcp"

#security group public
ingress_rules_public_value = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access from anywhere"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access from anywhere"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access from anywhere"
  },
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access to port 3000 from anywhere for Client - frontend"
  },
  {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access to port 5000 from anywhere for Server - backend"
  }
]


# # EC2 instance
# ami_id_value = "ami-0e449927258d45bc4" # amazon linux 2023 ami
# instance_type_value = "t2.micro"
# key_name_value = "virginia-key" # my key pair name
