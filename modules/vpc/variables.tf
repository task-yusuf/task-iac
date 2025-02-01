variable "region" {
  description = "Huawei Cloud region"
  type        = string
}

variable "access_key" {
  description = "Huawei Cloud Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Huawei Cloud Secret Key"
  type        = string
  sensitive   = true
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "my-vpc"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "enterprise_project_id" {
  description = "Enterprise Project ID (default project if empty)"
  type        = string
  default     = "0"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the default subnet"
  type        = string
  default     = "192.168.1.0/24"
}

variable "gateway_ip" {
  description = "Gateway IP for the default subnet"
  type        = string
  default     = "192.168.1.1"
}


variable "availability_zone" {
  description = "Availability zone of the subnet"
  type = string
  default = ""
}