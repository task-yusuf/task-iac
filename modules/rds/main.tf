
resource "huaweicloud_rds_instance" "this" {
    name = var.name
    region = var.region
    flavor = var.rds_flavor
    vpc_id = var.vpc_id
    subnet_id = var.subnet_id
    fixed_ip = var.fixed_ip
    security_group_id = var.security_group_id
    ha_replication_mode = var.ha_replication_mode
    availability_zone = [ 
        var.az_name_1,
        var.az_name_2,
     ]
     
     db {
        type = var.db_type
        version = var.db_version
        password = var.db_password
     }

     volume {
       type = var.db_volumetype
       size = var.db_volumesize
     }
}