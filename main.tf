terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu" {
  # Uncomment line below to have Terraform find the latest Ubuntu image for you
  ami = data.aws_ami.ubuntu.id

  # Uncomment line below and update ami image id in variables.tf if
  # you have a specific ami image id to use

  #ami           = "${var.ami_id}"

  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sshaccess.id]
  key_name               = var.myaws_keypair
  tags = {
    Name        = var.svr_name
    Owner       = var.tag_name
    TTL         = var.tag_ttl
    environment = var.tag_environment
  }
}

# Comment out data code block below if you are manually specifying ami_id above.
data "aws_ami" "ubuntu" {
  most_recent = true

  # Finds the latest Ubuntu 18.04 image to use by owner and sets the virtualization type, 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# Use an existing key pair. Uncomment the 'resource' code block below if not using an existing aws key pair
# resource "aws_key_pair" "sshaccesskey" {
#   key_name   = "<insert aws key pair name here>"
#   public_key = "<paste ssh public key here if you use this block"
# }

# Configure security group to allow SSH access to instance

resource "aws_security_group" "sshaccess" {
  name        = "${var.svr_name}-allow-ssh"
  description = "SSH and Internal Traffic"

  #vpc_id      = "${var.vpc_id}"

  tags = {
    Name        = var.svr_name
    Owner       = var.tag_name
    TTL         = var.tag_ttl
    Environment = var.tag_environment
  }

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

