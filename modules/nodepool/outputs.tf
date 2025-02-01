output "nodepool_id" {
  description = "The ID of the created node pool"
  value       = huaweicloud_cce_node_pool.this.id
}

output "security_group_id" {
  description = "id of the security group"
  value = huaweicloud_cce_node_pool.this.security_groups[0]
}