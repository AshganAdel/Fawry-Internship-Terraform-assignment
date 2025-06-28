# Infrastructure as Code (IaC) with Terraform
## Introduction

Infrastructure as Code (IaC) is the practice of managing and provisioning computing infrastructure using machine-readable configuration files, rather than physical hardware or interactive configuration tools.

*Terraform* is a popular open-source IaC tool that enables developers to define and provision infrastructure in a consistent, repeatable manner.

<p align="center">
  <img src="https://web-unified-docs-hashicorp.vercel.app/api/assets/terraform/latest/img/docs/intro-terraform-apis.png" width="600" alt="Terraform illustration">
</p>

## Project Structure
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
   git clone https://github.com/AshganAdel/Fawry-Internship-Terraform-assignment.git
### 2. Configure Credentials:
   Add your credentials by configuring AWS CLI command: aws configure , the type your access key and secret key.
### 3. Run terraform command:
   To apply the pre-prod infrastructure <br>
   Run:
   cd envs/pre-prod <br>
   terraform init <br>
   terraform plan <br>
   terraform apply <br>
   Same for the prod but cd envs/prod 
## Architecture Diagram:
   <p align="center">
  <img src="https://drive.google.com/file/d/1OZRaQD4WcFqHgtYBseiT-Ms3HQ53RVMs/view?usp=sharing" width="600" alt="Terraform illustration">
  </p>



