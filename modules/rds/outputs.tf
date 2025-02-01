output "rds_instance_id" {
  description = "The id of the rds instance"
  value = huaweicloud_rds_instance.this.id
}