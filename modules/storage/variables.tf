variable "storage_account" {
  description = "Azure storage account name for FinOps reports"
  type        = string
}

variable "container_name" {
  description = "Storage container name for FinOps reports"
  type        = string
  default     = "cost-reports"
}
