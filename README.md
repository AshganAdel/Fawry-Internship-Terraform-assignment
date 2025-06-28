# Infrastructure as Code (IaC) with Terraform
## Introduction

Infrastructure as Code (IaC) is the practice of managing and provisioning computing infrastructure using machine-readable configuration files, rather than physical hardware or interactive configuration tools.

*Terraform* is a popular open-source IaC tool that enables developers to define and provision infrastructure in a consistent, repeatable manner.

<p align="center">
  <img src="https://web-unified-docs-hashicorp.vercel.app/api/assets/terraform/latest/img/docs/intro-terraform-apis.png" width="600" alt="Terraform illustration">
</p>
## 📁 Project Structure
.
├── .github/<br>
│ └── workflows/<br>
│ └── terraform.yml # GitHub Actions workflow for appling pre-prod infrastructure <br>
│ └── terraformprod.yml # GitHub Actions workflow for appling prod infrastructure <br>
├── modules/ # Reusable Terraform modules<br>
│ └── network/ # module for creating VPC, Subnets and Internet Gateway<br>
│ └── Compute/ # module for creating EC2 instances and Security Groups<br>
│ └── Logging module/ # module for creating CloudWatch Logs group and S3 bucket and VPC Flow Logs routed to the central S3 bucket and CloudWatch Logs for Production only<br>
├── terraform.tfstate.d/ # has state file for each workspace<br>
├── envs/ # has Backend configuration (S3 + DynamoDB for state and locks) and Variable definitions (.tfvars) for each environment<br>
│ └── prod/ <br>
│ └── pre-prod/<br>
├── provider.tf # configure aws as a provider<br>
└── README.md # Documentation<br>


