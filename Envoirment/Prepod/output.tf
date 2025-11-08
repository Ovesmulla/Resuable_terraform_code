output "rg" {
  value = module.resource_group
}
output "stg" {
  value = module.storage_account
}
output "cont" {
  value = module.container
}

output "vnet_ids" {
  value = module.vnet.vnet_ids
}
