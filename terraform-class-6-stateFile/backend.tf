/*
terraform {
    backend "s3" {
        bucket = "project-1-terraform-statefile-store"
        key = "mahendra/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        dynamodb_table = "terraform_lock"

      
    }
}

*/