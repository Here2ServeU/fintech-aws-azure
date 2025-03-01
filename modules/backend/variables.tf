variable "azure_region" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the storage account"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "storage_container_name" {
  description = "Name of the storage container for Terraform state"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
}

variable "container_access_type" {
  description = "Access level for the storage container"
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
