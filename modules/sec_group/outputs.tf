output "security_group_id" {
  description = "The ID of the security group"
  value       = huaweicloud_networking_secgroup.this.id
}