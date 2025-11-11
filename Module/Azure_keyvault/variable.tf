variable "kv" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    sku_name                    = string
    enabled_for_disk_encryption = bool
    purge_protection_enabled    = bool
    soft_delete_retention_days  = number
  }))
}
