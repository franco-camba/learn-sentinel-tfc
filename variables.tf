variable "region" {
  description = "AWS region"
  default = "eu-west-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance for Cost Control Demo - Franco Camba - SE EMEA"
  default = "Provisioned by Terraform - Franco Camba - SE EMEA"
}