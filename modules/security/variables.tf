variable "azure_region" {
  description = "Azure region for security configurations"
  type        = string
}

variable "security_contact_email" {
  description = "Email for security alerts"
  type        = string
  default     = "security@example.com"
}

variable "security_contact_phone" {
  description = "Phone number for security alerts"
  type        = string
  default     = "+1234567890"
}

variable "security_alerts_enabled" {
  description = "Enable security alert notifications"
  type        = bool
  default     = true
}

variable "security_pricing_tier" {
  description = "Pricing tier for Azure Security Center (Standard or Free)"
  type        = string
  default     = "Standard"
}
