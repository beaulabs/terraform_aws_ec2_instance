variable "name" {
  default = "beau-ubuntu-developmentbox"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 18.04 Base Image"
  default     = "ami-057a852b5ed4b66bc"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default     = "m4.large"
}

variable "environment" {
  description = "name to pass to Name tag"
  default     = "beaulabs-development"
}

variable "myaws_keypair" {
  description = "name of existing aws keypair to supply"
  default     = "beau-uswest1"
}
