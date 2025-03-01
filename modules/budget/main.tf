resource "azurerm_cost_management_budget_subscription" "finops_budget" {
  name            = "FinOpsBudget"
  subscription_id = data.azurerm_subscription.primary.id
  amount          = 500
  time_grain      = "Monthly"

  notification {
    enabled          = true
    operator         = "GreaterThan"
    threshold        = 80
    contact_emails   = ["alerts@example.com"]
    threshold_type   = "Percentage"
  }
}
