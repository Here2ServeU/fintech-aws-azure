terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "finops_rg" {
  name     = var.resource_group_name
  location = var.azure_region
}

resource "azurerm_storage_account" "terraform_state" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.azure_region
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "state" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = var.container_access_type
}
