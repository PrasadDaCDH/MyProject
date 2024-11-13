
Terraform Initialization Commands:
Initialize Terraform: terraform init
Skip plugin installation: terraform init -get-plugins=false
Force plugin installation from a directory: terraform init -plugin-dir=PATH
Upgrade modules and plugins: terraform init -upgrade

Backend Configuration:
Update backend configuration: terraform init -migrate-state -force-copy
Skip backend configuration: terraform init -backend=false
Use local backend configuration: terraform init -backend-config=FILE
Change state lock timeout: terraform init -lock-timeout=120s

General Commands:
Terraform Version: terraform version
Download/Update Root Modules: terraform get -update=true
open Interactive Terminal: terraform console
Create Dependency Diagram: terraform graph | dot -Tpng > graph.png
Format Code to HCL Standards: terraform fmt
Validate Code Syntax: terraform validate
Enable Tab Auto-completion: terraform -install-autocomplete
Provider Requirements: terraform providers
Login and Logout: terraform login / terraform logout

Planning Terraform:
Produce a Plan: terraform plan
Output plan for reference: terraform plan -out current.tfplan
Plan for destruction: terraform plan -destroy
Target a specific resource: terraform plan -target=ADDRESS

Applying Terraform:
Apply Current State: terraform apply
Use previously generated plan: terraform apply current.tfplan
Enable auto-approval: terraform apply -auto-approve

Managing Workspaces:
List Workspaces: terraform workspace list
Create New Workspace: terraform workspace new development
Select Workspace: terraform workspace select default

Managing Terraform State:
List Resources in State: terraform state list
Import Resource into State: terraform state import ADDRESS ID
Move Resource in State: terraform state mv SOURCE DESTINATION
Pull State: terraform state pull > terraform.tfstate
Push State: terraform state push PATH
Replace Resource Provider: terraform state replace-provider A B
Taint a Resource: terraform taint ADDRESS
Untaint a Resource: terraform untaint ADDRESS
Show Details of a Resource: terraform state show ADDRESS

Destroying Terraform:
Destroy Managed Resources: terraform destroy
Enable auto-approval: terraform destroy -auto-approve

Outputs:
List Outputs: terraform output
Output a Specific Value: terraform output NAME
