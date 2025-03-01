resource "azurerm_security_center_contact" "finops_security" {
  email = "security@example.com"
  phone = "+1234567890"
  alert_notifications = true
  alerts_to_admins    = true
}

resource "azurerm_security_center_subscription_pricing" "finops_pricing" {
  tier            = "Standard"
}
