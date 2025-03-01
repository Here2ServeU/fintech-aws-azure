resource "azurerm_storage_account" "terraform_state" {
  name                     = "t2sfinopsterraform"
  resource_group_name      = "T2S-FinOps"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "state" {
  name                  = "terraform-state"
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}
