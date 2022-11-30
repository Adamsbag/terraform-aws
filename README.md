Provisioning AWS resources using Terraform config files

Resources:

- VPC
- At least two public subnets
- At least two private subnets
- Internet gateway
- At least two NAT gateways
- Public route table
- At least two private route tables

Created a layered Terraform configuration file architecture using remote state, data source and outputs to avoid single point of failure of the infrastructure configuration.
