# author    https://github.com/iroshanvidanage
# date      08/25/2024

# outputs are used to expose the values inside a module for other tf configurations

output "ami" {
    value = var.ami
}

output "instance_properties" {
  value = var.instance_properties
}