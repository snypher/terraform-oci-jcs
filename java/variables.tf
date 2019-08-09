variable "tenancy_ocid" {}

variable "tenancy" {}

variable "env_compartment_ocid" {}

variable "env_compartment_name" {}

variable "app_compartment_ocid" {}

variable "app_compartment_name" {}

# Used in naming convention. A best practice is to use all lower case.
variable "app_tag" {}

# Used in naming to separate between dev, test, staging, and production environments.
variable "environment" {}

# The region for other resources (VCN, instances, etc). This may or may not be the same as the home region.
variable "region" {}

variable "ad_list" {
  type = list
}

variable "identity_user" {}

variable "identity_password" {}

variable "identity_service_id" {}

variable "java_endpoint" {}

variable "group_psm_name" {}

variable "jcs_name" {}

variable "jcs_edition" {}

variable "jcs_service_version" {}

variable "jcs_bring_your_own_license" {}

variable "jcs_availability_domain" {}

variable "jcs_ssh_public_key" {}

variable "jcs_shape" {}

variable "jcs_managed_server_count" {}

variable "jcs_cluster_type" {}

variable "jcs_subnet_id" {}

variable "dbsystem_jcs_hostname" {}

variable "dbsystem_subnet_domain_name" {}

variable "dbsystem_jcs_pdb_name" {}

variable "jcs_database_user" {}

variable "jcs_database_password" {}

variable "jcs_admin_user" {}

variable "jcs_admin_password" {}

variable "jcs_storage_username" {}

variable "jcs_storage_user_token" {}

variable "jcs_create_lb" {}

variable "jcs_load_balancing_policy" {}

variable "jcs_load_balancer_subnet_id" {}

variable "jcs_enable_admin_console" {}

