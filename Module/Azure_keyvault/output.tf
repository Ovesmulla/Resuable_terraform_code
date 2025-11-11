output "kv-ids" {
  value = { for k, q in azurerm_key_vault.key_vault : k => q.id }
}
