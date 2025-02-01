variable "cluster_name" {
  description = "The name of the CCE cluster"
  type        = string
}

variable "cluster_type" {
  description = "The cluster type (e.g., VirtualMachine, ARM64)"
  type        = string
  default     = "VirtualMachine"
}

variable "flavor_id" {
  description = "The cluster specifications (e.g., cce.s1.small, cce.s2.medium)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the cluster will be created"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the cluster will be created"
  type        = string
}

variable "container_network_type" {
  description = "The container network type (e.g., overlay_l2, vpc-router, eni)"
  type        = string
  default     = "overlay_l2"
}

variable "authentication_mode" {
  description = "The authentication mode (e.g., rbac, authenticating_proxy)"
  type        = string
  default     = "rbac"
}

variable "security_group_id" {
  description = "The security group ID for the cluster"
  type        = string
  default     = ""
}

variable "eip" {
  description = "Optional EIP address for the cluster"
  type        = string
  default     = ""
}

variable "masters" {
  description = "List of availability zones for HA master nodes"
  type        = list(object({
    availability_zone = string
  }))
  default = []
}

variable "eni_subnet_id" {
  description = "List of ENI subnet IDs for CCE Turbo clusters"
  type        = list(string)
  default     = []
}

variable "component_configurations" {
  description = "Optional Kubernetes component configurations"
  type        = list(object({
    name           = string
    configurations = list(object({
      name  = string
      value = string
    }))
  }))
  default = []
}