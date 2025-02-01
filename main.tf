data "huaweicloud_availability_zones" "name" {}

module "vpc" {
  region = "tr-west-1"
  access_key = ""
  secret_key = ""
  source = "./modules/vpc"
  vpc_name = "task_vpc"
  cidr_block = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
  gateway_ip = "10.0.1.1"
}

module "db_sg" {
  source = "./modules/sec_group"
  name = "db_sg"
  region = "tr-west-1"
  rules = [ 
    {
        direction = "ingress"
        ethertype = "IPv4"
        protocol = "tcp"
        port_range_min = 3306
        port_range_max = 3306
        remote_ip_prefix = "0.0.0.0/0"
    }
   ]
}

module "task_rds" {
  source = "./modules/rds"
  region = "tr-west-1"
  name = "task_rds"
  rds_flavor = "rds.mysql.n1.large.2.ha"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  fixed_ip = "10.0.1.2"
  security_group_id = module.db_sg.security_group_id
  ha_replication_mode = "async"
  az_name_1 = data.huaweicloud_availability_zones.name.names[0]
  az_name_2 = data.huaweicloud_availability_zones.name.names[1]
  db_type = "MySQL"
  db_version =  "8.0"
  db_password = "Teleskop@2024"
  db_volumetype = "CLOUDSSD"
  db_volumesize = "40"
}

module "task_swr" {
  source = "./modules/swr"
  organization_name = "task_organization"
  region = "tr-west-1"
}

module "task_cce" {
  source = "./modules/cce"
  cluster_name = "task-cce"
  cluster_type = "VirtualMachine"
  flavor_id = "cce.s1.small"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  container_network_type = "overlay_l2"
  authentication_mode = "rbac"
}

module "task_cce_node_pool" {
  source = "./modules/nodepool"
  region = "tr-west-1"
  cluster_id = module.task_cce.cluster_id
  nodepool_name = "task-cce-node-pool"
  os = "CentOS 7.6"
  flavor_id = "s7n.large.2"
  availability_zone = data.huaweicloud_availability_zones.name.names[0]
  key_pair = "KeyPair-2129"
  root_volume_size = 40
  root_volume_type = "SSD"
  data_volumes = [
    {size = 100,
    volumetype = "SSD"}
  ]
}







