terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.98.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "ropra"
    storage_account_name = "roprastor"
    container_name       = "ropracontainer"
    key                  = "mod3.terraform.tfstate"
  }
}

provider "azurerm" {
  features{}
}