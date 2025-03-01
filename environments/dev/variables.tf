variable "azure_region" {
  description = "Azure region for deployment"
  type        = string
}

variable "storage_account" {
  description = "Azure storage account for FinOps reports"
  type        = string
}

variable "alert_action_group" {
  description = "Azure Monitor Action Group for cost alerts"
  type        = string
}
