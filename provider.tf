# author    https://github.com/iroshanvidanage
# date      08/20/2024

# configuration objects
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    /*
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
*/

    /* for partnet / community providers need to define this providers block 
    explicitly before using the provider plugins */
    /*
    digitalocean = {
      source = "digitalocean/digitalocean"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
*/
  }
}



# configure AWS provider
provider "aws" {
  region = var.region
}

/*
provider "azurerm" {
  skip_provider_registration = true
  features {

  }
}

provider "digitalocean" {

}

provider "github" {
  token = var.token
}
*/