terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

variable "splunk" {
  default = "8088"
}

variable "payment_app_cidr" {
  default = "172.31.0.0/16"
}

variable "region" {
  default = "us-east-1"
}

variable "environment" {
  default = "DEV"
}

resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.payment_app_cidr]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.payment_app_cidr]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags,
    tomap(
      { "Category" = "Private" }
    )
  )

}

resource "aws_eip" "example" {
  domain = "vpc"

  tags = merge(local.common_tags,
    tomap(
      { "Category" = "Public" }
    )
  )
}

locals {
  common_tags = {
    Environment = var.environment
    Terraform   = true
    MangedBy    = "CSRE"
  }
}