variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {}

variable "private_key_password" {}

# Used in naming convention. A best practice is to use all lower case.
variable "app_tag" {}

# Used in naming to separate between dev, test, staging, and production environments.
variable "environment" {}

# Home region. Most IAM resources (compartments, users, etc) must be created in the tenancy's home region.
variable "home_region" {}

# The region for other resources (VCN, instances, etc). This may or may not be the same as the home region.
variable "region" {}

# Base CIDR for VCN. All subnets are automatically derived from this base address.
variable "vcn_cidr" {
  type = "string"
  default = "192.168.1.0/24"
}

# CIDR for data subnet
variable "subnet_data_cidr" {
  type = "string"
  default = "192.168.1.16/28"
}

variable "subnet_data_private" {
  type = "string"
  default = "true"
}

variable "subnet_data_dnslabel" {
  type = "string"
  default = "data"
}

# CIDR for app subnet
variable "subnet_app_cidr" {
  type = "string"
  default = "192.168.1.32/28"
}

variable "subnet_app_private" {
  type = "string"
  default = "true"
}

variable "subnet_app_dnslabel" {
  type = "string"
  default = "app"
}

# CIDR for lbaas subnet
variable "subnet_lbaas_cidr" {
  type = "string"
  default = "192.168.1.48/28"
}

variable "subnet_lbaas_private" {
  type = "string"
  default = "false"
}

variable "subnet_lbaas_dnslabel" {
  type = "string"
  default = "lbaas"
}

# CIDR for admin subnet
variable "subnet_admin_cidr" {
  type = "string"
  default = "192.168.1.64/28"
}

variable "subnet_admin_private" {
  type = "string"
  default = "false"
}

variable "subnet_admin_dnslabel" {
  type = "string"
  default = "admin"
}

variable "dhcp_options_server_type" {
}

variable "dhcp_options_domain_names" {
}

variable "anywhere_cidr" {
}

variable "oracle_service_label" {
}

variable "oracle_service_ocid" {
}

variable "default_destination_type" {
}

variable "default_source_type" {
}

variable "service_destination_type" {
}

variable "egress_stateless" {
}

variable "ingress_stateless" {
}

variable "tcp_protocol" {
}

variable "udp_protocol" {
}

variable "icmp_protocol" {
}

variable "all_protocol" {
}

variable "icmp_type" {
}

variable "icmp_code" {
}

variable "oracle_service_port" {
  type = "string"
  default = "443"
}

variable "database_port" {
  type = "string"
  default = "1521"
}

variable "ssh_port" {
  type = "string"
  default = "22"
}

variable "http_port" {
  type = "string"
  default = "80"
}

variable "https_port" {
  type = "string"
  default = "443"
}

variable "db_system_availability_domain" {
  type = "string"
  default = "0"
}

variable "db_system_database_edition" {
  type = "string"
  default = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
}

variable "db_system_db_version" {
  type = "string"
  default = "12.2.0.1"
}

variable "db_system_admin_password" {
  type = "string"
}

variable "db_system_source" {
  type = "string"
  default = "NONE"
}

variable "db_system_character_set" {
  type = "string"
  default = "AL32UTF8"
}

variable "db_system_ncharacter_set" {
  type = "string"
  default = "AL16UTF16"
}

variable "db_system_auto_backup_enabled" {
  type = "string"
  default = "true"
}

variable "db_system_recovery_window_in_days" {
  type = "string"
  default = "60"
}

variable "db_system_db_name" {
  type = "string"
}

variable "db_system_pdb_name" {
  type = "string"
}

variable "db_system_db_workload" {
  type = "string"
  default = "OLTP"
}

variable "db_system_hostname_prefix" {
  type = "string"
  default = "dbs"
}

variable "db_system_cluster_name_prefix" {
  type = "string"
  default = "cl"
}

variable "db_system_shape" {
  type = "string"
}

variable "db_system_ssh_public_keys" {
  type = "string"
}

variable "db_system_cpu_core_count" {
  type = "string"
  default = "2"
}

variable "db_system_node_count" {
  type = "string"
}

variable "db_system_data_storage_percentage" {
  type = "string"
  default = "80"
}

variable "db_system_data_storage_size_in_gb" {
  type = "string"
}

variable "db_system_disk_redundancy" {
  type = "string"
  default = "HIGH"
}

variable "db_system_license_model" {
  type = "string"
}

