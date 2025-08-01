# AWS Landing Zone with Terraform

## Introduction
This project implement a reproducible AWS Landing Zone using Infrastructure as Code (IaC) with Terraform—restricted to AWS Free Tier–eligible resources.

## IaC and Terraform Introduction 
Infrastructure as Code (IaC) is the practice of managing and provisioning computing infrastructure using machine-readable configuration files, rather than physical hardware or interactive configuration tools.

*Terraform* is a popular open-source IaC tool that enables developers to define and provision infrastructure in a consistent, repeatable manner.

<p align="center">
  <img src="https://web-unified-docs-hashicorp.vercel.app/api/assets/terraform/latest/img/docs/intro-terraform-apis.png" width="600" alt="Terraform illustration">
</p>

## Project Structure
.<br>
├── .github/<br>
│ └── workflows/<br>
│ └── terraform.yml # GitHub Actions workflow for appling pre-prod and prod infrastructure <br>
├── modules/ # Reusable Terraform modules<br>
│ └── network/ # module for creating VPC, Subnets and Internet Gateway<br>
│ └── Compute/ # module for creating EC2 instances and Security Groups<br>
│ └── Logging/ # module for creating CloudWatch Logs group and S3 bucket and VPC Flow Logs routed to the central S3 bucket and CloudWatch Logs for Production only<br>
│ └── ecr/ # module for creating public repository 
├── envs/ # has Backend configuration (S3 + DynamoDB for state and locks) and Variable definitions (.tfvars) for each environment<br>
│ └── prod/ <br>
│ └── pre-prod/<br>
├── provider.tf # configure aws as a provider<br>
└── README.md # Documentation<br>

## Terraform Workflow & Commands
Terraform follows a declarative workflow, where you describe your desired infrastructure state, and Terraform makes it happen. The standard workflow includes the following steps:
### 1. terraform init:
   Initializes the working directory, Configures backend and downloads required provider plugins and modules.
### 2. terraform plan:
   Creates an execution plan, showing what actions Terraform will take without making actual changes.
### 3. terraform apply:
   Applies the changes required to reach the desired state of the configuration.<br>
   common flags: Auto-approve (e.g., terraform apply -auto-approve).
### 4. terraform destroy:
   Destroys all resources defined in the configuration.<br>
   common flags: Auto-approve (e.g., terraform destroy -auto-approve).

## Running the Project
### 1. Clone the Repository:
```bash
   git clone https://github.com/AshganAdel/Fawry-Internship-Terraform-assignment.git
```
### 2. Configure Credentials:
   Add your credentials by configuring AWS CLI command: 
```bash
   aws configure
```
   then type your access key and secret key.
### 3. Run terraform command:
   To apply the pre-prod infrastructure <br>
   Run:
   ```bash
   cd envs/pre-prod 
   terraform init 
   terraform plan -var-file="pre-prod.tfvars"
   terraform apply -var-file="pre-prod.tfvars"
   ```
   Same for the prod but cd envs/prod 
## Architecture Diagram:
   <p align="center">
  <img src="https://drive.google.com/uc?export=view&id=1OZRaQD4WcFqHgtYBseiT-Ms3HQ53RVMs" alt="Terraform illustration">
  </p>



