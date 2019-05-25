[configure oci]: https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm
[oci]: https://cloud.oracle.com/cloud-infrastructure
[virtual dbsystem]: https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm
[jcs]: https://cloud.oracle.com/en_US/java
[terraform]: https://www.terraform.io
[oracle_design_solution_1]: https://docs.oracle.com/en/solutions/learn-secure-network-topology/index.html
[oracle_develop_solution_1]: https://docs.oracle.com/en/solutions/multi-tenant-topology-using-terraform/index.html
[oracle_cloud_solutions]: https://docs.oracle.com/en/solutions/index.html
[oracle_terraform_modules]: https://github.com/oracle-terraform-modules
[oracle_terraform_iam]: https://github.com/oracle-terraform-modules/terraform-oci-iam
[oracle_terraform_vcn]: https://github.com/oracle-terraform-modules/terraform-oci-default-vcn
[oracle_terraform_oke]: https://github.com/oracle-terraform-modules/terraform-oci-oke

# Terraform for [Oracle Java Cloud Service (JCS)][jcs]

## About

Terraform code that provisions a demo environment for [Oracle Java Cloud Service (JCS)][jcs] using [Oracle Cloud Infrastructure (OCI)][oci] as the IaaS platform. The infrastructure schema's database for the JCS will reside in an [OCI virtual DB System][virtual dbsystem].

The multi-layer network architecture deployed is based on the following [Oracle Cloud Solutions][oracle_cloud_solutions]:

* [Learn about creating a secure network topology on Oracle Cloud Infrastructure][oracle_design_solution_1]
* [Create a multitier network topology on Oracle Cloud Infrastructure][oracle_develop_solution_1]

The code is based on following [Oracle Terraform Modules][oracle_terraform_modules]:

* [Oracle Cloud Infrastructure Terraform Modules for Identity and Access Management][oracle_terraform_iam]
* [Oracle Cloud Infrastructure Default VCN Terraform Module][oracle_terraform_vcn]
* [Terraform for Oracle Container Engine][oracle_terraform_oke]

## Pre-reqs

1. Download and install [Terraform][terraform] (v0.11+).
2. [Configure your OCI account to use Terraform][configure oci]

## Environment variables

Ensure you set proxy environment variables if you're running behind a proxy

```
$ export http_proxy=http://<address_of_your_proxy>.com:80/
$ export https_proxy=http://<address_of_your_proxy>:80/
```
## Quickstart

```
$ git clone https://github.com/snypher/terraform-oci-jcs.git
$ cd terraform-oci-jcs 
$ vi terraform.tfvars
```
* Set the following mandatory variables in terraform.tfvars
    - tenancy_ocid
    - user_ocid
    - private_key_path
    - fingerprint
    - regionrn about creating a secure network topology on Oracle Cloud Infrastructure
    - oracle_service_label
    - oracle_service_ocid
    - db_system_admin_password
    - db_system_ssh_public_keys

* Optionaly override other variables like vcn_cidr, subnet_app_cidr, db_system_database_edition, etc in terraform.tfvars

See references which are inluded in the terraform.tfvars comments.

### Deploy JCS Demo

Initialize Terraform:
```
$ terraform init
```

View what Terraform plans do before actually doing it:
```
$ terraform plan
```

Compare what will be provisioned in terms of compartments, vcn, subnets, dbsystem and jcs vs what is available under your service limits of the account in your region and the ADs and modify accordingly.

Create OCI resources (iam, network, object storage, dbsystem) and JCS:
```
$ terraform apply
```

## Features


## Related Docs


## Acknowledgement


