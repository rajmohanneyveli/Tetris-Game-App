 terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
  storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
	access_key  ="__storagekey__"
	}
	}
  provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "dev" {
  name     = "acr-rg"
  location = "Australia East"
}

resource "azurerm_container_registry" "acr" {
  name                = "__containerRegistry__"
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  sku                 = "__Basic__"
  admin_enabled       = false
}