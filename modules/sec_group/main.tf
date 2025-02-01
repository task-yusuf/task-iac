resource "huaweicloud_networking_secgroup" "this" {
  name        = var.name
  description = var.description
  region = var.region
}

resource "huaweicloud_networking_secgroup_rule" "rules" {
  for_each = { for idx, rule in var.rules : idx => rule }

  direction         = lookup(each.value, "direction", null)
  ethertype         = lookup(each.value, "ethertype", null)
  protocol         = lookup(each.value, "protocol", null)
  port_range_min    = lookup(each.value, "port_range_min", null)
  port_range_max    = lookup(each.value, "port_range_max", null)
  remote_ip_prefix  = lookup(each.value, "remote_ip_prefix", null)
  security_group_id = huaweicloud_networking_secgroup.this.id
  depends_on = [ huaweicloud_networking_secgroup.this ]
}