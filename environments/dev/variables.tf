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

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}
