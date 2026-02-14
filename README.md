🔹 Project Summary – Vault + GitHub Actions + Terraform + AWS
1️⃣ Vault Setup

Installed Vault on Amazon Linux EC2.

Enabled Vault UI.

Enabled KV secrets engine.

Stored AWS credentials (access key, secret key, region) securely in Vault.

2️⃣ GitHub Repository Setup

Terraform code stored in GitHub.

Created GitHub Actions workflow.

Added VAULT_TOKEN in GitHub repository secrets.

3️⃣ Workflow Execution

Developer pushes code to main branch.

GitHub Actions pipeline is triggered.

GitHub reads VAULT_TOKEN from repo secrets.

GitHub authenticates to Vault.

Vault returns AWS credentials.

GitHub sets credentials as environment variables.

4️⃣ Terraform Execution

Terraform initializes (terraform init).

Terraform validates plan (terraform plan).

Terraform deploys infrastructure (terraform apply).

5️⃣ Final Outcome

AWS resources (e.g., EC2) are created.

No AWS credentials are stored in GitHub or Terraform code.

Secrets are securely managed via Vault.
