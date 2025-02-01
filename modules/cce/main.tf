resource "huaweicloud_cce_cluster" "this" {
  name                   = var.cluster_name
  cluster_type           = var.cluster_type
  flavor_id              = var.flavor_id
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  container_network_type = var.container_network_type
  authentication_mode    = var.authentication_mode

  
  eip = var.eip != "" ? var.eip : null

  
  security_group_id = var.security_group_id != "" ? var.security_group_id : null

  
  dynamic "component_configurations" {
    for_each = var.component_configurations
    content {
      name           = component_configurations.value.name
      configurations = jsonencode(component_configurations.value.configurations)
    }
  }

  
  dynamic "masters" {
    for_each = var.masters
    content {
      availability_zone = masters.value.availability_zone
    }
  }

  
  eni_subnet_id = length(var.eni_subnet_id) > 0 ? join(",", var.eni_subnet_id) : null
}