resource "azurerm_resource_group" "ex" {
  name     = "example2"
  location = "West Europe"
}
resource "azurerm_storage_account" "ex" {
  name                = "stor1a32ge"
  resource_group_name = "example2"

  location                 = "west europe"
  account_tier             = "Standard"
  
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "example" {
  name                  = "mybackstate"
  storage_account_name  = "stor1a32ge"
  container_access_type = "private"
}