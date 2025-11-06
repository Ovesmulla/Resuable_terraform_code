output "storage_account" {
  description = "ids of storage account "
  value       = { for key in azurerm_storage_account.storage_account : key.name => key.id }
}
