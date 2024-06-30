resource "azurerm_resource_group" "ex3" {
  name     = var.rgg
  location = "West Europe"
}

resource "azurerm_storage_account" "exampe" {
  name                     = "examplesto2"
  resource_group_name      = azurerm_resource_group.ex3.name
  location                 = azurerm_resource_group.ex3.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "exame" {
  name                  = "dfgh"
  storage_account_name  = azurerm_storage_account.exame.name
  container_access_type = "private"
}