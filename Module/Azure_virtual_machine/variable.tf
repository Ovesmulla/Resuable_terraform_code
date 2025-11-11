variable "vms" {
  type = map(object({
    vm_name                         = string
    size                            = string
    vnet_name                       = string
    pip_name                        = string
    key_vault_name                  = string
    nic_name                        = string
    secret_name                     = string
    secret_value                    = string
    resource_group_name             = string
    location                        = string
    disable_password_authentication = bool
    os_disk = list(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))

}
