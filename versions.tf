terraform {
  required_version = "~> 1.5.7"

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~>1.63"
    }
  }
}