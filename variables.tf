#KEYS

variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret key"
}

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

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "route_table_cidr_block" {
  description = "Route Table CIDR block"
  type        = string
  default     = "0.0.0.0/0"
}
