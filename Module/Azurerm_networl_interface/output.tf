output "nic_ids" {
 value = { for k, q in azurerm_network_interface.nic: k => q.id}
}
