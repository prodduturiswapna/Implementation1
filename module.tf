terraform {
  backend "azurerm" {
    resource_group_name     = "swapna"
    storage_account_name    = "swapna222"
    container_name          = "terraform"
    key                     = "terraform.tfstate"
  }
}
provider "azurerm" {
features {}
}
module "azure_vm" {
  source		= "./swapna_vm_module"
  resource_group_name 	= "swapna-rg-azurevm"
  location		= "East US"
  vnet_name		= "myVnet1"
  vnet_address_space	= "10.0.0.0/16"
  subnet_name		= "mySubnet1"
  subnet_prefix		= "10.0.1.0/24"
  nic_name		= "testNic"
  no_of_vms		= 3
  vm_size		= "Standard_DS1_v2"
  disk_type		= "Standard_LRS"
  disk_name		= "vmDisk2"
  admin_username	= "adminuser"
  admin_password	= "Welcome@1234"
}
