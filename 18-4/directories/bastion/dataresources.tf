data "azurerm_resource_group" "exa1" {
    for_each = var.bastion
  name = each.value.rg_name
}

data "azurerm_virtual_network" "exa2" {
    for_each = var.bastion
  name                = each.value.vnet_name
  resource_group_name = data.azurerm_resource_group.exa1[each.key].name
}

data "azurerm_subnet" "exa3" {
    for_each = var.bastion
  name                 = each.value.subnet_name
  virtual_network_name = data.azurerm_virtual_network.exa2[each.key].name
  resource_group_name  = data.azurerm_resource_group.exa1[each.key].name
}



