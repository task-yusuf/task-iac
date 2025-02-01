resource "huaweicloud_cce_node_pool" "this" {
  cluster_id               = var.cluster_id
  region                   = var.region
  name                     = var.nodepool_name
  os                       = var.os
  initial_node_count       = var.initial_node_count
  flavor_id                = var.flavor_id
  availability_zone        = var.availability_zone
  key_pair                 = var.key_pair
  type                     = var.node_type

  root_volume {
    size       = var.root_volume_size
    volumetype = var.root_volume_type
  }

  dynamic "data_volumes" {
    for_each = var.data_volumes
    content {
      size       = data_volumes.value.size
      volumetype = data_volumes.value.volumetype
    }
  }
}