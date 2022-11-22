variable "aws_region" {
  description = "AWS Region for deployed resources"
  type        = string
  default     = "us-east-1"
}

variable "tags_prod" {
  description = "Resource tags"
  type        = map(any)
  default = {
    "Owner"         = "ian.soares",
    "Environment"   = "production",
    "Business Unit" = "sust"
  }
}

variable "tags_dev" {
  description = "Resource tags"
  type        = map(any)
  default = {
    "Owner"         = "ian.soares",
    "Environment"   = "dev",
    "Business Unit" = "sust"
  }
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "VPC Public Subnets"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "VPC Private Subnets"
  type        = list(any)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnets" {
  description = "VPC Database Subnets"
  type        = list(any)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "az_list" {
  description = "List of desired AZs to be deployed"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "allow_inbound_cpl" {
  description = "Allow inbound rules for Control Plane"
  type        = list(any)
  default     = ["80", "443", "8000"]
}

variable "allow_inbound_ng" {
  description = "Allow inbound rules for Node Group"
  type        = list(any)
  default     = ["443", "8000"]
}