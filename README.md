
# 🔐 Vault Multicloud Demo

This repository contains **production-grade Terraform code** to provision a multicloud environment across **Microsoft Azure** and **IBM Cloud**, prepared for demonstrating how to use **HashiCorp Vault** to centrally generate, manage, and distribute secrets securely.

## 🌎 Infrastructure Overview

The infrastructure provisioned by this demo includes:

- ☁️ **Microsoft Azure**
  - A managed **Azure Kubernetes Service (AKS)** cluster

- ☁️ **IBM Cloud**
  - A managed **OpenShift (ROKS)** cluster
  - A **Virtual Server Instance (VSI)** running Linux in IBM VPC

These resources can be securely integrated with Vault to demonstrate secret injection in:

- Kubernetes secrets (AKS and ROKS)
- Vault Agent injection or API-driven variable exports on Linux VM

## 📂 Repository Structure

```
vault-multicloud-demo/
├── modules/
│   ├── azure-aks/        # AKS Terraform module
│   ├── ibm-roks/         # ROKS Terraform module
│   └── ibm-vm/           # IBM Linux VM module
├── envs/
│   └── dev/              # Demo environment configuration
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── scripts/              # (Optional) helper scripts for Vault integration
└── README.md
```

## ✅ Requirements

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-install-ibmcloud-cli)
  - With the VPC plugin: `ibmcloud plugin install vpc-infrastructure`

You must also have access to:
- An Azure subscription with AKS permissions
- An IBM Cloud account with access to VPC, ROKS, and VSI

## 🔐 Authentication via Environment Variables

### Azure
```bash
export ARM_CLIENT_ID="xxxxx"
export ARM_CLIENT_SECRET="xxxxx"
export ARM_SUBSCRIPTION_ID="xxxxx"
export ARM_TENANT_ID="xxxxx"
```

### IBM Cloud
```bash
export IC_API_KEY="xxxxx"
```

These will be picked up automatically by the Terraform providers.

## 🚀 Usage

```bash
cd envs/dev

# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply changes
terraform apply
```

This will provision:

- An AKS cluster on Azure
- A ROKS cluster on IBM Cloud
- A Linux virtual machine on IBM Cloud

## 🎯 Next Step: Integrating with Vault

Once provisioned, you can use these resources to:

- Enable Vault’s **Kubernetes auth method** on both clusters
- Configure Vault Agents or environment export on the Linux VM
- Demonstrate a centralized secret (`apikey`, `db_password`, etc.) being injected in real-time across all three platforms

A future step-by-step integration guide with Vault will be provided in this repository.

## 📌 Notes

- Ensure you are using unique names and resource groups for your cloud resources to avoid conflicts.
- This code is designed for demonstration purposes, but follows production Terraform best practices (modular design, variable abstraction, environment separation).

## 🧠 Authors

Developed by [Olavo Borges](https://github.com/oborges)

---

Feel free to contribute or open issues to improve this demo.
