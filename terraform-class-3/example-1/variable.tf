variable "region" {
    description = "providing region to deploy the infra"
    default = ""
}

variable "AMI" {
    description = "providing the AMI ID to launch the instance"
    default = ""
  
}

variable "instance_type" {
    description = "providing instance type  for AMI"
    default = ""
  
}

variable "tag" {
    default = ""
  
}