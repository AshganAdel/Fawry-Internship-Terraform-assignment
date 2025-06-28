terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  acces_key = ${{ secrets.ACCESS_KEY }}
  secret_key = ${{ secrets.SECRET_KEY }}
}

