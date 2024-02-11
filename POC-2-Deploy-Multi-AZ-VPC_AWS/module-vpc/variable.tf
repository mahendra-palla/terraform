variable "cidr-block" {
  description = "This is the CIDR Block, we used to create VPC"
  default     = " "
}

variable "public-cidrs" {
  type    = list(any)
  default = ["10.0.0.0/29", "10.0.1.0/29"]

}

variable "private-cidrs" {
  type    = list(any)
  default = ["10.0.2.0/29", "10.0.3.0/29"]

}