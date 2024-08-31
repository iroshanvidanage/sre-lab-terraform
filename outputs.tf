# author    https://github.com/iroshanvidanage
# date      08/25/2024

# outputs are used to expose the values inside a module for other tf configurations

output "ami" {
  value = var.ami
}

output "instance_properties" {
  value = var.instance_properties
}

output "public-subnet-1" {
  value = var.public-subnet-1
}

output "app-port" {
  value = var.app-port
}

output "instance_types_regions_list" {
  value = var.instance_types_regions_list
}

output "instance_types_regions_map" {
  value = var.instance_types_regions_map
}

output "env" {
  value = var.env
}

output "region" {
  value = var.region
}
