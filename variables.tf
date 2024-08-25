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
  default     = "ap-south-1"
}

variable "region_list" {
  description = "AWS availability zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "ami" {
  type        = string
  description = "AWS Machine Image"
  default     = "ami-020916b60b78f7108"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "instance_properties" {
  description = "ami & ec2 type"
  default     = ["ami-020916b60b78f7108", "t2.micro"]
}

variable "token" {
  description = "github token"
  default     = "GITHUB_TOKEN"

}

variable "vpc-ip" {
  description = "vpc cidr range"
  type = string
  default = "172.20.192.0./22" # 4 subnets
}

variable "public-subnet-1" {
  type = string
  default = "172.20.192.0/24"
}

variable "app-port" {
  default = 8080
}