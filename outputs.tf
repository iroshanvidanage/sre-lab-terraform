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

output "ds_iam_user" {
  value = data.aws_iam_user.user-iroshan.arn
}


output "ds_vpc" {
  value = data.aws_vpc.default.cidr_block
}
output "ds_file" {
  value = data.local_file.test.content
}

output "ds_aws_ami" {
  value = data.aws_ami.amazon_linux_latest.id
}