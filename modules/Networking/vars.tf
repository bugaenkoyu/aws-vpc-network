variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = string
  description = "CIDR block for Public Subnet"
}

variable "private_subnets_cidr" {
  type        = string
  description = "CIDR block for Private Subnet"
}

variable "region" {
  description = "Region in which the bastion host will be launched"
}

variable "availability_zones" {
  type        = string
  description = "Our NETWORK availability zones"
}

variable "private_data_cidr" {
  type        = string
  description = "CIDR block for Data Subnet"
}
