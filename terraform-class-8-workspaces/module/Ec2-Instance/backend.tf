terraform {
  backend "s3" {
    bucket         = "mahe333" # change this
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}