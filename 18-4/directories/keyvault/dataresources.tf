data "azurerm_resource_group" "exaa1" {
    for_each = var.keyvault
  name = each.value.rg_name
}

data "azurerm_client_config" "current" {}
