# terraform-playground

This repository uses a 'Packer' Github Actions to create an AWS EC2 AMI with Docker built-in.
After successful completion of Packer workflow, 'Terraform' workflow is triggered, which creates an AWS EC2 instance based on the newly created custom AMI.
'Packer' workflow is triggered on a push event on the repository with changes made either to Packer directory or Packer workflow.
'Terraform' workflow is triggered on push event on the repository with changes made to Ansible, Terraform directories or Terraform workflow.

You should have Github Secrets on your repository, containing 'AWS_ACCESS_KEY', 'AWS_SECRET_KEY' and 'PRIVATE_KEY'.
Both Packer and Terraform use Ansible to provision the newly created image/instance.

You should also modify 'terraform/variables.tf' file to fit your needs.
The file includes the following variables that need to be set, according to your needs.

"AWS Region"
"VPC CIDR block"
"subnet_cidr_block"
"availability_zone"
"route_table_cidr_block"
"instance_type"
"ami_id"
"ssh_user"
"key_pair_name"