#REGION

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

#VPC

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

#SUBNET

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

#AVAILABILITY ZONE

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "us-east-1a"
}

#ROUTE TABLE

variable "route_table_cidr_block" {
  description = "Route Table CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}

#INSTANCE TYPE

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

#AMI ID

variable "ami_id" {
  description = "Instance AMI ID"
  type        = string
  default     = "ami-007855ac798b5175e"
}

variable "ssh_user" {
  description = "Default user on instance"
  type        = string
  default     = "ubuntu"
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
  default     = "~/.ssh/shtajiryan.pem"
}

variable "key_pair_name" {
  description = "AWS EC2 key-pair name"
  type        = string
  default     = "shtajiryan"
}