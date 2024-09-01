locals {
  dev_tags = {
    Environment = "Development"
  }

  common_tags = {
    Service = "service_name"
    Team    = "SRE"
  }
}

