variable "splunk" {
  default = "8088"
}

variable "dev_api" {}
variable "prod_api" {}
variable "https" {}

variable "vpc" {}

variable "region" {
  default = "us-east-1"
}

variable "environment" {}