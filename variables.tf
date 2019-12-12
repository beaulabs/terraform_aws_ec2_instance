variable "svr_name" {
  default = "beau-midnight"
}

variable "tag_name" {
  default = "beau@hashicorp"
}

variable "tag_ttl" {
  default = "48"
}

variable "tag_environment" {
  default = "development"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 18.04 Base Image"
  default     = "ami-057a852b5ed4b66bc"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default     = "m5.large"
}

variable "myaws_keypair" {
  description = "name of existing aws keypair to supply"
  default     = "beau-uswest1"
}

