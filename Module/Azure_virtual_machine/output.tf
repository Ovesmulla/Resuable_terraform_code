output "vms_ids" {
  value = { for k, l in azurerm_linux_virtual_machine.vm : k => l.id }
}
