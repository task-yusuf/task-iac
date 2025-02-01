variable "cluster_id" {
  description = "The ID of the CCE cluster where the node pool will be created"
  type        = string
}

variable "nodepool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "os" {
  description = "The OS for the nodes (e.g., EulerOS 2.5, Ubuntu 20.04)"
  type        = string
  default     = "EulerOS 2.5"
}

variable "initial_node_count" {
  description = "Initial number of nodes in the pool"
  type        = number
  default     = 2
}

variable "flavor_id" {
  description = "The instance flavor for the nodes (e.g., s3.large.4)"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone where the nodes will be created"
  type        = string
}

variable "key_pair" {
  description = "The SSH key pair to use for the nodes"
  type        = string
}

variable "node_type" {
  description = "The type of nodes (e.g., vm, baremetal)"
  type        = string
  default     = "vm"
}

variable "root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 40
}

variable "root_volume_type" {
  description = "Type of the root volume (e.g., SAS, SSD)"
  type        = string
  default     = "SAS"
}

variable "data_volumes" {
  description = "List of additional data volumes"
  type = list(object({
    size       = number
    volumetype = string
  }))
  default = [
    { size = 20, volumetype = "SAS" }
  ]
}

variable "region" {
  description = "The region for the nodes (e.g., s3.large.4)"
  type        = string
}