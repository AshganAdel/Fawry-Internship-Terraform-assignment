# Infrastructure as Code (IaC) with Terraform
## Introduction

Infrastructure as Code (IaC) is the practice of managing and provisioning computing infrastructure using machine-readable configuration files, rather than physical hardware or interactive configuration tools.

*Terraform* is a popular open-source IaC tool that enables developers to define and provision infrastructure in a consistent, repeatable manner.

<p align="center">
  <img src="https://web-unified-docs-hashicorp.vercel.app/api/assets/terraform/latest/img/docs/intro-terraform-apis.png" width="600" alt="Terraform illustration">
</p>
## 📁 Project Structure
.
├── .github/
│ └── workflows/
│ └── terraform.yml # GitHub Actions workflow for appling pre-prod infrastructure 
│ └── terraformprod.yml # GitHub Actions workflow for appling prod infrastructure 
├── modules/ # Reusable Terraform modules
│ └── network/ # module for creating VPC, Subnets and Internet Gateway
│ └── Compute/ # module for creating EC2 instances and Security Groups
│ └── Logging module/ # module for creating CloudWatch Logs group and S3 bucket and VPC Flow Logs routed to the central S3 bucket and CloudWatch Logs for Production only
├── terraform.tfstate.d/ # has state file for each workspace
├── envs/ # has Backend configuration (S3 + DynamoDB for state and locks) and Variable definitions (.tfvars) for each environment
│ └── prod/ 
│ └── pre-prod/
├── provider.tf # configure aws as a provider
└── README.md # Documentation


