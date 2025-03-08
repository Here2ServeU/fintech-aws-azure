# T2S FinOps Infrastructure on Azure with Terraform

This repository provisions a FinOps infrastructure on Microsoft Azure using Terraform modules and environments (dev, stage, prod).

It includes budget monitoring, cost anomaly detection, automatic cost optimization, security logging, and storage.

---

## Features
- **Azure Cost Management & Budgets** to track and control spending.
- **Azure Advisor & Cost Anomaly Detection** to identify unexpected costs.
- **Azure Monitor Alerts** for real-time cost monitoring.
- **Azure Security Center** for security insights.
- **Azure Blob Storage** for FinOps cost reports.
- **Azure Automation Runbooks** to stop underutilized VMs when cost anomalies occur.
- **Terraform modules & environments** for scalable infrastructure.

---
## Project Structure
```plaintext
T2S-FINOPS-AZURE/
├── environments/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfvars
│   │   ├── variables.tf
│   │   ├── versions.tf
│   ├── prod/
│   ├── stage/
├── modules/
│   ├── backend/
│   ├── budget/
│   ├── cost_monitoring/
│   ├── automation_runbooks/
│   ├── storage/
│   ├── security/
└── README.md
```

---

## Prerequisites

Before deploying, ensure you have:
- Terraform installed (>= 1.5.0)
- Azure CLI installed and logged in (az login)
- An Azure Resource Group for state management
- Azure Monitor Action Group for cost alerts

---

## Step 1: Backend (State Management)
- Navigate to /modules/backend/ and configure the Terraform backend:
```hcl 
resource_group_name  = "t2s-finops-backend"
storage_account_name = "t2sfinopsstorage"
container_name       = "terraformstate"
key                  = "state/finops.tfstate"
```

- Run the following command to initialize the backend:
```hcl
terraform init 
terraform validate
terraform apply -auto-approve
```

## Step 2: Configure Variables in the environments/dev/ Directory
- Modify **terraform.tfvars** inside environments/dev/:
```hcl
azure_region        = "eastus"
cost_alert_email    = "alerts@t2s-finops.com"
storage_account     = "t2sfinopsstorage"
resource_group_name = "t2s-finops-resources"
automation_account  = "t2s-finops-automation"
```

- Modify the **backend.tf** file:
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "t2s-finops-backend"
    storage_account_name = "t2sfinopsstorage"
    container_name       = "terraformstate"
    key                  = "state/finops.tfstate"
  }
}
```

## Step 3: Deploy the Infrastructure

- Run the following commands inside **environments/dev/**:
``bash
cd environments/dev
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars" -auto-approve
```

## Step 4: Verify Resources

After deployment, check if resources were created:
```bash
az monitor budget list --resource-group t2s-finops-resources
az monitor activity-log alert list --resource-group t2s-finops-resources
az storage account list --query "[?name=='t2sfinopsstorage']"
az automation runbook list --automation-account-name t2s-finops-automation --resource-group t2s-finops-resources
```

## Step 5: Deploy to Other Environments

To deploy in stage or prod, switch to the respective directory:
```bash
cd environments/stage
terraform apply -var-file="terraform.tfvars" -auto-approve

cd environments/prod
terraform apply -var-file="terraform.tfvars" -auto-approve
```

## Step 6: Destroy the Infrastructure

To remove resources:
```bash
terraform destroy -var-file="terraform.tfvars" -auto-approve
```

If storage account deletion fails, manually empty it before re-running Terraform:
```bash
az storage blob delete-batch --source terraformstate --account-name t2sfinopsstorage
```

---

## Troubleshooting

### Issue: Automation Runbook Not Triggering

**Error:** “Runbook execution failed due to missing authentication”

**Fix:**
- Ensure Azure Automation Runbook has the correct Managed Identity permissions:
```bash
az role assignment create --assignee "<managed_identity_id>" --role "Contributor" --scope "/subscriptions/<subscription_id>"
```

### Issue: Cost Alert Not Triggering

**Error:** “Azure Monitor Alert not triggering when cost exceeds threshold”

**Fix:**
- Ensure Budget Alerts are properly configured:
```bash
az monitor budget update --amount 500 --email-owner true --email-service-principal true
```

---

### Key Takeaways
- **Terraform Modules** for FinOps Scalability
- **Cost Optimization** via **Azure Budgets & Advisor**
- **Azure Automation Runbooks** to Stop Underutilized VMs
- **Azure Security Center Integration** for Enhanced Protection
- **Blob Storage** for Cost Reports & Audit Logs

**Happy FinOps Optimization!**

---

### **Why This README is Effective**
- **Step-by-step deployment guide**  
- **Common errors & solutions for troubleshooting**  
- **Scalable Terraform structure for multi-environment deployment**  
- **Clearly documents purpose & resources used**  
