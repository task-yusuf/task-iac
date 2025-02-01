variable "name" {
  description = "Security group name"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group"
}

variable "rules" {
  description = "List of security group rules"
  type = list(object({
    direction        = optional(string)
    ethertype        = optional(string)
    protocol         = optional(string)
    port_range_min   = optional(number)
    port_range_max   = optional(number)
    remote_ip_prefix = optional(string)
  }))
}


variable "region" {
  description = "Description of the security group"
  type        = string
}