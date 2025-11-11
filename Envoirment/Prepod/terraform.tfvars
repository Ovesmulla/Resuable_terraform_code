resource_group = {
  rg1 = {
    name       = "rg-prepod-001"
    location   = "central india"
    managed_by = "terraform"
    tags = {
      envoirment = "prepod"
      applcation = "todoapp"
    }
  }
  rg2 = {
    name     = "rg-prepod-002"
    location = "central india"
  }
}

storage_account = {
  stg1 = {
    name                     = "storageprepod001os"
    resource_group_name      = "rg-prepod-001"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stg2 = {
    name                             = "storageprepod002os"
    resource_group_name              = "rg-prepod-002"
    location                         = "central india"
    account_tier                     = "Standard"
    account_replication_type         = "GRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    access_tier                      = "Cool"
    https_traffic_only_enabled       = true
    min_tls_version                  = "TLS1_0"

  }
}

container = {
  cont1 = {
    name                              = "container1"
    storage_account_name              = "storageprepod001os"
    resource_group_name               = "rg-prepod-001"
    container_access_type             = "private"
    encryption_scope_override_enabled = "true"
  }
  cont2 = {
    name                 = "container1"
    storage_account_name = "storageprepod002os"
    resource_group_name  = "rg-prepod-002"
  }
}

vnet = {
  vnet1 = {
    name                = "vnet-prepod-001"
    resource_group_name = "rg-prepod-001"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]
    # # list of object vairable with ternary operator
    # subnets = [
    #   {
    #     name             = "subnet-prepod-001"
    #     address_prefixes = ["10.0.10.0/24"]
    #   },
    #   {
    #     name             = "subnet-prepod-002"
    #     address_prefixes = ["10.0.20.0/24"]
    # }]

    # map of object vairable without ternary operator
    subnets = {
      sub1 = {
        name             = "subnet-prepod-001"
        address_prefixes = ["10.0.10.0/24"]
      }
      sub2 = {
        name             = "subnet-prepod-002"
        address_prefixes = ["10.0.20.0/24"]
      }
    }
  }
  vnet2 = {
    name                           = "vnet-prepod-002"
    resource_group_name            = "rg-prepod-002"
    location                       = "central india"
    address_space                  = ["10.0.0.0/16"]
    private_endpoint_vnet_policies = "Disabled"
    sub1 = {
      name             = "subnet-prepod-003"
      address_prefixes = ["10.0.30.0/24"]
    }
  }
  vnet3 = {
    name                           = "vnet-prepod-003"
    resource_group_name            = "rg-prepod-002"
    location                       = "central india"
    address_space                  = ["10.0.0.0/16"]
    private_endpoint_vnet_policies = "Disabled"
  }
}

pip = {
  pip1 = {
    name                 = "pip-prepod-001"
    location             = "central india"
    resource_group_name  = "rg-prepod-001"
    allocation_method    = "Static"
    ddos_protection_mode = "Disabled"
  }
  pip2 = {
    name                = "pip-prepod-002"
    location            = "central india"
    resource_group_name = "rg-prepod-002"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    nic_name             = "nic-prepod-001"
    subnet_name          = "subnet-prepod-001"
    virtual_network_name = "vnet-prepod-001"
    location             = "central india"
    resource_group_name  = "rg-prepod-001"
    pip_name             = "pip-prepod-001"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  nic2 = {
    nic_name             = "nic-prepod-002"
    subnet_name          = "subnet-prepod-002"
    virtual_network_name = "vnet-prepod-001"
    location             = "central india"
    resource_group_name  = "rg-prepod-001"
    pip_name             = "pip-prepod-001"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

nsg = {
  nsg1 = {
    name                = "nsg-prepod-001"
    resource_group_name = "rg-prepod-001"
    location            = "central india"
    subnet_name         = "subnet-prepod-001"
    vnet_name           = "vnet-prepod-001"
    pip_name            = "pip-prepod-001"
    security_rules = [{
      name                       = "AllowSSH"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      direction                  = "Inbound"
    }]

  }
  nsg2 = {
    name                = "nsg-prepod-002"
    resource_group_name = "rg-prepod-002"
    location            = "central india"
    subnet_name         = "subnet-prepod-003"
    vnet_name           = "vnet-prepod-002"
    pip_name            = "pip-prepod-002"
    security_rules = [{
      name                       = "AllowSSH1"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      direction                  = "Inbound"
    }]
  }
}

kv = {
  key1 = {
    name                        = "kvprepod001os"
    resource_group_name         = "rg-prepod-001"
    location                    = "central india"
    sku_name                    = "standard"
    enabled_for_disk_encryption = true
    purge_protection_enabled    = false
    soft_delete_retention_days  = 7
  }
  key2 = {
    name                        = "kvprepod002os"
    resource_group_name         = "rg-prepod-002"
    location                    = "central india"
    sku_name                    = "standard"
    enabled_for_disk_encryption = true
    purge_protection_enabled    = false
    soft_delete_retention_days  = 7
  }
}

secrets = {
  secret1 = {
    key_vault_name      = "kvprepod001os"
    resource_group_name = "rg-prepod-001"
    secret_name         = "vm1"
    secret_value        = "prepodvm001"
  }
  secret2 = {
    key_vault_name      = "kvprepod001os"
    resource_group_name = "rg-prepod-001"
    secret_name         = "password1"
    secret_value        = "Oves@12345"
  }
  secret3 = {
    key_vault_name      = "kvprepod002os"
    resource_group_name = "rg-prepod-002"
    secret_name         = "vm2"
    secret_value        = "prepodvm002"
  }
  secret4 = {
    key_vault_name      = "kvprepod002os"
    resource_group_name = "rg-prepod-002"
    secret_name         = "password2"
    secret_value        = "Oves@12345"
  }
}
vms = {
  vm1 = {
    vm_name                         = "vmprepod001os"
    size                            = "Standard_F2"
    vnet_name                       = "vnet-prepod-001"
    pip_name                        = "pip-prepod-001"
    key_vault_name                  = "kvprepod001os"
    nic_name                        = "nic-prepod-001"
    secret_name                     = "vm1"
    secret_value                    = "password1"
    location                        = "central india"
    resource_group_name             = "rg-prepod-001"
    disable_password_authentication = false
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }]
  }
  vm2 = {
    vm_name                         = "vmprepod002os"
    size                            = "Standard_F2"
    vnet_name                       = "vnet-prepod-002"
    pip_name                        = "pip-prepod-002"
    key_vault_name                  = "kvprepod002os"
    nic_name                        = "nic-prepod-002"
    secret_name                     = "vm2"
    secret_value                    = "password2"
    location                        = "central india"
    resource_group_name             = "rg-prepod-002"
    disable_password_authentication = false
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }]
  }
}
