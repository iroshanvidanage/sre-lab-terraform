terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }

    aws = {
      source = "hashicorp/aws"
      # version = "~> 2.54"
    }
  }
}

provider "aws" {
  region = var.region
  # access_key = "AKIAIOSFODNN7EXAMPLE"
  # secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}


resource "aws_eip" "kplabs_app_ip" {
  domain = "vpc"
}

variable "region" {
  default = "us-east-1"
}