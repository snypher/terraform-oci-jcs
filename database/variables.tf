variable "tenancy_ocid" {}

variable "compartment_ocid" {}

# Used in naming the resources.
variable "app_tag" {}

# Used in naming the resources.
variable "environment" {}

variable "ad_list" {
  type = "list"
}

variable "db_system_availability_domain" {}

variable "db_system_database_edition" {}

variable "db_system_db_version" {}

variable "db_system_admin_password" {}

variable "db_system_source" {}

variable "db_system_character_set" {}

variable "db_system_ncharacter_set" {}

variable "db_system_auto_backup_enabled" {}

variable "db_system_recovery_window_in_days" {}

variable "db_system_db_name" {}

variable "db_system_pdb_name" {}

variable "db_system_db_workload" {}

variable "db_system_subnet_id" {}

variable "db_system_hostname_prefix" {}

variable "db_system_hostname" {}

variable "db_system_cluster_name_prefix" {}

variable "db_system_cluster_name" {}

variable "db_system_shape" {}

variable "db_system_ssh_public_keys" {}

variable "db_system_cpu_core_count" {}

variable "db_system_node_count" {}

variable "db_system_data_storage_percentage" {}

variable "db_system_data_storage_size_in_gb" {}

variable "db_system_disk_redundancy" {}

variable "db_system_license_model" {}

