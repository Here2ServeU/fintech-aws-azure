variable "azure_region" {
  description = "Azure region where budget resources will be created"
  type        = string
}

variable "budget_name" {
  description = "Name of the cost budget"
  type        = string
  default     = "FinOpsBudget"
}

variable "budget_amount" {
  description = "Amount of the budget threshold"
  type        = number
  default     = 500
}

variable "budget_time_grain" {
  description = "Time grain for budget (Monthly, Quarterly, or Annually)"
  type        = string
  default     = "Monthly"
}

variable "notification_threshold" {
  description = "Threshold for budget notifications (in percentage)"
  type        = number
  default     = 80
}

variable "notification_email" {
  description = "Email for budget notifications"
  type        = list(string)
  default     = ["alerts@example.com"]
}
