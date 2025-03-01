resource "azurerm_storage_account" "finops_reports" {
  name                     = var.storage_account
  resource_group_name      = "T2S-FinOps"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "reports" {
  name                  = "cost-reports"
  storage_account_name  = azurerm_storage_account.finops_reports.name
  container_access_type = "private"
}
