output "vnet_id" {
  value = module.vnet.vnet_id
}

output "key_vault_id" {
  value = module.keyvault.key_vault_id
}

output "vm_id" {
  value = module.vm.vm_id
}

output "app_gateway_id" {
  value = module.app_gateway.app_gateway_id
}
