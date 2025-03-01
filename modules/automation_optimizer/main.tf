resource "azurerm_function_app" "finops_optimizer" {
  name                = "finops-auto-optimizer"
  resource_group_name = "T2S-FinOps"
  location            = "East US"
  app_service_plan_id = azurerm_app_service_plan.finops_plan.id

  site_config {
    linux_fx_version = "PYTHON|3.9"
  }
}
