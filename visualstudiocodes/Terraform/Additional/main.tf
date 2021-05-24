
provider "azurerm"  {
  features {}

/*
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
*/
}




data "azurerm_resource_group" "my_rg" {
  name = "Hyderabad"
}

resource "azurerm_storage_account" "my_st" {
  name                     = "mystorage9290168189"
  resource_group_name      = data.azurerm_resource_group.my_rg.name
  location                 = data.azurerm_resource_group.my_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}


resource "azurerm_virtual_network" "my_vnet" {
  name                = "virtualNetwork1"
  location            = data.azurerm_resource_group.my_rg.location
  resource_group_name = data.azurerm_resource_group.my_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
 
}




