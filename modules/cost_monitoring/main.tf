resource "azurerm_monitor_metric_alert" "cost_alert" {
  name                = "CostAnomalyAlert"
  resource_group_name = "T2S-FinOps"
  scopes             = [data.azurerm_subscription.primary.id]

  criteria {
    metric_namespace = "Microsoft.CostManagement"
    metric_name      = "TotalCost"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1000
  }

  action {
    action_group_id = var.alert_action_group
  }
}
