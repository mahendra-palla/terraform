provider "aws" {
    region = "ap-south-1"
}


resource "aws_instance" "Back-end-statefile-project" {
    ami =   "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"

    tags = {
      
      Name = "Back-end-statefile-project-TAG"
    }
}


#BELOW TWO MODULES ARE FOR LEARNING, IN PROD WE CAN ACTUALLY CREATES MANUALLY THROUGH UI, AS BELOW ARE ONE TIME ACTIVITY"

resource "aws_s3_bucket" "Mahi" {
    bucket = "mahi-bucket-3331000"


}


resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}


/*terraform {
    backend "s3" {
        bucket = "project-1-terraform-statefile-store"
        key = "mahendra/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        dynamodb_table = "terraform_lock"

      
    }
}
*/