output "rg-ids" {
  description = "id of resourece group"
  value       = { for key in azurerm_resource_group.resource_group : key.name => key.id }
}
