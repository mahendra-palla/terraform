
module "vpc" {
  source     = "./module-vpc"
  cidr-block = "10.0.0.0/27"


}