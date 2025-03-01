resource_group_name   = "T2S-FinOps"           # Replace with your Azure Resource Group
storage_account_name  = "t2sfinopsterraform"  # Replace with your Azure Storage Account
container_name        = "terraform-state"     # Storage container for Terraform state
key                  = "state/finops.tfstate" # Path to state file
