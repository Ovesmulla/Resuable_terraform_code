output "vnet_ids" {
  description = "Map of Virtual Network name to its ID"
  value = { for k, v in azurerm_virtual_network.vnet : k => v.id}
}