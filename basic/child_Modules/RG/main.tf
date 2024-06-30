resource "azurem_resource_group" "fame" {
  for_each = var.rg_list
  name=each.value.name
  location=each.value.location
}