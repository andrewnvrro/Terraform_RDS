# Terraform_RDS
A Terraform code that creates a Relational Database Service in AWS. 

**Prerequisites**

    AWS Credentials
    Terraform
**rds.tf** - configuration file where it creates the database itself, it indicates the name of the database, storage/storage type, engine/engine version.

**vpc.tf** - creation of a VPC which is needed to provision resources in AWS. it has 2 subnets and are grouped with the name *db_subnet*.

**network.tf** - contains the network needed for the VPC such as: Internet gateway, route table and the security groups (*to permit or deny access within ports*)
