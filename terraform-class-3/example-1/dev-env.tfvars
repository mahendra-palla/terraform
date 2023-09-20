region = "ap-south-1"
AMI = "ami-05552d2dcf89c9b24"
instance_type = "t2.micro"
tag = "pre-prod-environment"

# We need to use the below command if we using .tfvars file
#  terraform plan/apply -var-file=dev-env.tfvars