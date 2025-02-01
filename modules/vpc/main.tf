provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
    
resource "huaweicloud_vpc" "this" {
  name       = var.vpc_name
  cidr       = var.cidr_block
  enterprise_project_id = var.enterprise_project_id
}


resource "huaweicloud_vpc_subnet" "default" {
  vpc_id       = huaweicloud_vpc.this.id
  name         = "default-subnet"
  cidr         = var.subnet_cidr_block
  gateway_ip   = var.gateway_ip
  dhcp_enable  = true
  primary_dns  = "114.114.114.114"
  secondary_dns = "8.8.8.8"
  availability_zone = var.availability_zone
}

