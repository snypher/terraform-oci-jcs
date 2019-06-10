variable "tenancy_ocid" {}

variable "compartment_ocid" {}

# Used in naming convention. A best practice is to use all lower case.
variable "app_tag" {}

# Used in naming to separate between dev, test, staging, and production environments.
variable "environment" {}

# The region for other resources (VCN, instances, etc). This may or may not be the same as the home region.
variable "region" {}

variable "ad_list" {
  type = "list"
}

variable "create_bastion" {}

variable "bastion_availability_domain" {}

variable "bastion_shape" {}

variable "bastion_operating_system" {}

variable "bastion_operating_system_version" {}

variable "bastion_image_ocid" {}

variable "bastion_subnet_id" {}

variable "bastion_ssh_public_key" {}

variable "bastion_hostname_label" {}

variable "bastion_source_type" {}

