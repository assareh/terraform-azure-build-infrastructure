# resource "null_resource" "cluster" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     build_number = timestamp()
#   }
#   provisioner "local-exec" {
#     command = "env"
#   }
# }

provider "azurerm" {
  features {}
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resource-group"
  location = var.location
}

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   subnet {
#     name           = "subnet1"
#     address_prefix = "10.0.1.0/24"
#   }

#   subnet {
#     name           = "subnet2"
#     address_prefix = "10.0.2.0/24"
#     security_group = azurerm_network_security_group.example.id
#   }

#   tags = {
#     environment = "Production"
#   }
# }

# data "azurerm_subnet" "example" {
#   name                 = "subnet1"
#   virtual_network_name = azurerm_virtual_network.example.name
#   resource_group_name  = azurerm_resource_group.example.name
# }

# output rg_name {
#   value = azurerm_resource_group.example.name
# }

# output subnet_name {
#   value       = data.azurerm_subnet.example.name
# }

# output vnet_name {
#   value       = azurerm_virtual_network.example.name
# }
