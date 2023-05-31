# Terraform Playground

This repository uses a Packer GitHub Action to create a custom AWS EC2 AMI with Docker pre-installed. After the Packer workflow completes successfully, a Terraform workflow is triggered to create an AWS EC2 instance using the new custom AMI.

The Packer workflow is triggered by a push event to the repository that includes changes to the Packer directory or workflow. The Terraform workflow is triggered by a push event that includes changes to the Ansible or Terraform directories or workflow.

Make sure to have the 'AWS_ACCESS_KEY', 'AWS_SECRET_KEY', and 'PRIVATE_KEY' set as GitHub Secrets in your repository. Both Packer and Terraform use Ansible for provisioning.

You should also modify the `terraform/variables.tf` file to fit your needs. The file includes the following variables that need to be set according to your needs:

- AWS Region
- VPC CIDR block
- subnet_cidr_block
- availability_zone
- route_table_cidr_block
- instance_type
- ami_id
- ssh_user
- key_pair_name
