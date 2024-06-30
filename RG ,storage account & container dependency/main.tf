resource "azurerm_resource_group" "ex2" {
  name     = "exampl1-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "exampl00" {
    depends_on = [ azurerm_resource_group.ex2 ]
  name                     = "example11storaccount"
  resource_group_name      = azurerm_resource_group.ex2.name
  location                 = azurerm_resource_group.ex2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_container" "example" {
    depends_on = [ azurerm_storage_account.exampl00]
  name                  = "vhdsdghjk"
  storage_account_name  = azurerm_storage_account.exampl00.name
  container_access_type = "private"
}