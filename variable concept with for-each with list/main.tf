resource "azurerm_resource_group" "nameee" {
    for_each = toset( [var.rg_list ])
  name=each.value
  location = "west Europe"
}
