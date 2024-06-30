resource "azurerm_resource_group" "rges" {
    for_each = var.rggg
    name=each.value.name
    location = each.value.location
  
}