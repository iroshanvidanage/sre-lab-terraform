/*
variable "access_key" {
    type = string
    description = "The AWS access key"
}

variable "secret_key" {
    type = string
    description = "The AWS secret key"
}
*/
variable "region" {
  type        = string
  description = "The AWS region"
}

variable "region_list" {
  description = "AWS availability zones"
  default     = ["ap-south-1a", "ap-south-1b"] # list data types
}

variable "ami" {
  type        = string # restricting value to a string value type
  description = "AWS Machine Image"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "instance_properties" {
  description = "ami & ec2 type"
  default     = ["var.ami", "t2.micro"]
}

variable "token" {
  description = "github token"
  default     = "GITHUB_TOKEN"

}

variable "vpc-ip" {
  description = "vpc cidr range"
  # 4 subnets
}

variable "public-subnet-1" {}

variable "app-port" {
  default = 8080
}

variable "instance_types_regions_list" {
  type    = list(any)
  default = ["t3.micro", "t3.small", "c2.medium"] # list starts with position 0
}

variable "instance_types_regions_map" {
  type = map(any)
  default = {
    us-east-1      = "t3.micro"
    us-west-1      = "t3.small"
    eu-west-2      = "c2.medium"
    ap-southeast-1 = "m5.large"
  }
}

variable "dev-users" {
  type    = list(any)
  default = ["iroshan", "akalanka", "thuji"]
}

variable "env" {
  default = "dev"
}
