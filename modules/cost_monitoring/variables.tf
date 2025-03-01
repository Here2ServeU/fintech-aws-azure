variable "azure_region" {
  description = "Azure region for cost monitoring"
  type        = string
}

variable "alert_action_group" {
  description = "Azure Monitor Action Group ID for cost alerts"
  type        = string
}

variable "cost_alert_name" {
  description = "Name of the cost anomaly alert"
  type        = string
  default     = "CostAnomalyAlert"
}

variable "cost_alert_threshold" {
  description = "Threshold for cost anomaly alert"
  type        = number
  default     = 1000
}
