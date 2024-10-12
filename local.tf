locals {
  dev_tags = {
    Environment = "Development"
  }

  common_tags = {
    Service = "service_name"
    Team    = "SRE"
  }

  instance_types = {
    dev  = "t2.micro"
    prod = "m5.large"
  }
}

