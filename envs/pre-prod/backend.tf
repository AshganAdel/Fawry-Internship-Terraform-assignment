terraform {
  backend "s3" {
    bucket         = "terraform-statefile-bucket-2"
    key            = "teraform/pre-prod/terraform.tfstate"
    region         = "us-west-2"
    #dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}