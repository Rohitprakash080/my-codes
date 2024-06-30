resource "azurerm_resource_group" "rges" {
    for_each = var.rges
    name=each.value.name
    location = each.value.location
  
}