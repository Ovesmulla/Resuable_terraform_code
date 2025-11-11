output "rg" {
  value = module.Resource_group
}
output "stg" {
  value = module.Storage_Account
}
output "cont" {
  value = module.Container
}

output "vnet_ids" {
  value = module.Virtual_Network
}

output "pip_ids" {
  value = module.Public_Ip
}

output "nic_ids" {
  value = module.Network_Interface_Card
}

output "nsg_ids" {
  value = module.Netwok_security_group
}

output "key_vault_ids" {
  value = module.Key_Vault
}
output "vm_ids" {
  value = module.Virtual_Machine
}
