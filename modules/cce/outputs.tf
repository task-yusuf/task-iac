output "cluster_id" {
  description = "The ID of the CCE cluster"
  value       = huaweicloud_cce_cluster.this.id
}

output "cluster_name" {
  description = "The name of the CCE cluster"
  value       = huaweicloud_cce_cluster.this.name
}

output "cce_security_group"{
    description = "Security group of the cce cluster"
    value = huaweicloud_cce_cluster.this.security_group_id

}