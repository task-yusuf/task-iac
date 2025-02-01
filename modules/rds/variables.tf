variable "name" {
  description = "The name of the RDS instance"
  type        = string
}

variable "az_name_1" {
  description = "Names of the available azs in the region"
  type = string
}

variable "az_name_2" {
  description = "Names of the available azs in the region"
  type = string

}

variable "rds_flavor" {
  description = "The flavor (instance type) of the RDS instance"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the RDS instance will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the RDS instance"
  type        = string
}

variable "db_type" {
  description = "The type of the database engine (e.g., MySQL, PostgreSQL, etc.)"
  type        = string
}

variable "db_password" {
  description = "The password for the database user"
  type        = string
}

variable "db_version" {
  description = "The version of the database engine"
  type        = string
}

variable "db_volumetype" {
  description = "The storage volume type for the RDS instance"
  type        = string
}

variable "db_volumesize" {
  description = "The size of the storage volume in GB"
  type        = string
}

variable "fixed_ip" {
  description = "The fixed IP address for the RDS instance, if applicable"
  type        = string
}

variable "ha_replication_mode" {
  description = "ha replication mode of the database"
  type        = string
}

variable "region" {
  description = "ha replication mode of the database"
  type        = string
}