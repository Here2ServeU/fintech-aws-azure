module "backend" {
  source = "../../modules/backend"
}

module "budget" {
  source = "../../modules/budget"
  azure_region = var.azure_region
}

module "cost_monitoring" {
  source = "../../modules/cost_monitoring"
  azure_region       = var.azure_region
  alert_action_group = var.alert_action_group
}

module "automation_optimizer" {
  source = "../../modules/automation_optimizer"
  azure_region = var.azure_region
}

module "storage" {
  source         = "../../modules/storage"
  storage_account = var.storage_account
}

module "security" {
  source = "../../modules/security"
  azure_region = var.azure_region
}
