# Provision an EC2 instance in AWS
This Terraform configuration provisions an EC2 instance in AWS.

## Details
By default, this configuration will automatically provision the latest ami image of Ubuntu 18.04 with an instance type of t2.micro in the us-west-1 region. The AMI ID, region, and type can all be set as variables. Further, if you have a specific ami image you wish to use, you can comment out the auto filtering and set it statically in variables. 

Note that you need to set environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY. You will also need to create an AWS key pair in the region you wish to deploy into and paste your PUBLIC ssh key into the aws_key_pair resource block.
