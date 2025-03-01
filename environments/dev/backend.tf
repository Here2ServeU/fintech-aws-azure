terraform {
  backend "azurerm" {
    storage_account_name = "t2sfinopsterraform"
    container_name       = "terraform-state"
    key                  = "state/finops.tfstate"
  }
}
