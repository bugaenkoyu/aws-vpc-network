variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of the vpc"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = string
  description = "CIDR block for Public Subnet"
  default     = "10.0.10.0/24"
}

variable "availability_zones" {
  description = "Our NETWORK availability zones"
  default = "eu-central-1a"
}

variable "private_subnets_cidr" {
  type        = string
  description = "CIDR block for Private Subnet"
  default     = "10.0.20.0/24"
}

variable "private_data_cidr" {
  type        = string
  description = "CIDR block for Data Subnet"
  default     = "10.0.30.0/24"
}