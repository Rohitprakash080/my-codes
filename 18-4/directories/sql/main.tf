# resource "azurerm_resource_group" "exam1" {
#   name     = "roh3"
#   location = "japanwest"
# }

resource "azurerm_mssql_server" "exam2" {
    for_each = var.sqldb
  name                         = each.value.sqlserver_name
  resource_group_name          = data.azurerm_resource_group.examp1.name
  location                     = data.azurerm_resource_group.examp1.location
  version                      = each.value.server_version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password

  tags = {
    environment = each.value.environment
  }
}

resource "azurerm_storage_account" "exam3" {
    for_each = var.sqldb
  name                     = each.value.storage_ac_name
  resource_group_name      = data.azurerm_resource_group.examp1.name
  location                 = data.azurerm_resource_group.examp1.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_mssql_database" "exam5" {
    for_each = var.sqldb
   name           = each.value.sql_db_name
  server_id      = azurerm_mssql_server.exam2[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = false
  sku_name       = "S0"
#   zone_redundant = false
#   enclave_type   = "VBS"

  tags = {
    environment = each.value.environment
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
