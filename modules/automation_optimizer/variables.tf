variable "azure_region" {
  description = "Azure region for automation"
  type        = string
}

variable "function_app_name" {
  description = "Name of the Azure Function App for cost optimization"
  type        = string
  default     = "finops-auto-optimizer"
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan where the function app will be deployed"
  type        = string
}
