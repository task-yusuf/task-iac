output "vpc_id" {
  description = "The ID of the created VPC"
  value       = huaweicloud_vpc.this.id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = huaweicloud_vpc.this.name
}

output "subnet_id" {
  description = "The ID of the default subnet"
  value       = huaweicloud_vpc_subnet.default.id
}