resource "azurerm_resource_group" "exam1" {
  name     = "ro-resources"
  location = "canadacentral"
}

resource "azurerm_mssql_server" "exam2" {
  name                         = "ro1sqlserver"
  resource_group_name          = azurerm_resource_group.exam1.name
  location                     = azurerm_resource_group.exam1.location
  version                      = "12.0"
  administrator_login          = "roadminuser"
  administrator_login_password = "dhodala@0009"

  tags = {
    environment = "Devlopment"
  }
}

resource "azurerm_storage_account" "exam3" {
  name                     = "rostor1"
  resource_group_name      = azurerm_resource_group.exam1.name
  location                 = azurerm_resource_group.exam1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "exam4" {
  name                = "ro1examplesqldatabase"
  resource_group_name = azurerm_resource_group.exam1.name
  location            = azurerm_resource_group.exam1.location
  server_name         = azurerm_mssql_server.exam2.name

  tags = {
    environment = "Devlopment"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}