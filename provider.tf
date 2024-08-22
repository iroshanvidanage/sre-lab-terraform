# author    https://github.com/iroshanvidanage
# date      08/20/2024

# configuration objects
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }

    # azurerm = {
    #   source = "hashicorp/azurerm"
    #   version = "~> 4.5"
    # }
  }
}



# configure AWS provider
provider "aws" {
  region = var.region
}