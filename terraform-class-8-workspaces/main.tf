

#Below is Example, please update this by looking at module-ec-instance

module "ec2-instance" {
    source = "./modules/Ec2_instance"
    ami_value = "ami-05552d2dcf89c9b24"
    instance_type_value = "t2.micro"
    availability_zone_value = "ap-south-1b"
    subnet_id_value = "subnet-0555f061aba3a8cf1"
    Instance_TAG = "Jenkins_Server"
  
}