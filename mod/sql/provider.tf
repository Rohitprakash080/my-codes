terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.98.0"
    }
  }
#     backend "azurerm" {
#     resource_group_name  = "example2"
#     storage_account_name = "stor1a32ge"
#     container_name       = "mybackstate"
#     key                  = "vmsujeet4.terraform.tfstate"
#   }
}

provider "azurerm" {
  features{}
}