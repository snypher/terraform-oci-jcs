variable "tenancy_ocid" {
  type    = string
}

variable "tenancy" {
  type    = string
}

variable "user_ocid" {
  type    = string
}

variable "fingerprint" {
  type    = string
}

variable "private_key_path" {
  type    = string
}

variable "private_key_password" {
  type    = string
}

# Used in naming convention. A best practice is to use all lower case.
variable "app_tag" {
  type    = string
}

# Used in naming to separate between dev, test, staging, and production environments.
variable "environment" {
  type    = string
}

# Home region. Most IAM resources (compartments, users, etc) must be created in the tenancy's home region.
variable "home_region" {
  type    = string
}

# The region for other resources (VCN, instances, etc). This may or may not be the same as the home region.
variable "region" {
  type    = string
}

# Base CIDR for VCN. All subnets are automatically derived from this base address.
variable "vcn_cidr" {
  type    = string
  default = "192.168.1.0/24"
}

# CIDR for data subnet
variable "subnet_data_cidr" {
  type    = string
  default = "192.168.1.16/28"
}

variable "subnet_data_private" {
  type    = string
  default = "true"
}

variable "subnet_data_dnslabel" {
  type    = string
  default = "data"
}

# CIDR for app subnet
variable "subnet_app_cidr" {
  type    = string
  default = "192.168.1.32/28"
}

variable "subnet_app_private" {
  type    = string
  default = "true"
}

variable "subnet_app_dnslabel" {
  type    = string
  default = "app"
}

# CIDR for lbaas subnet
variable "subnet_lbaas_cidr" {
  type    = string
  default = "192.168.1.48/28"
}

variable "subnet_lbaas_private" {
  type    = string
  default = "false"
}

variable "subnet_lbaas_dnslabel" {
  type    = string
  default = "lbaas"
}

# CIDR for admin subnet
variable "subnet_admin_cidr" {
  type    = string
  default = "192.168.1.64/28"
}

variable "subnet_admin_private" {
  type    = string
  default = "false"
}

variable "subnet_admin_dnslabel" {
  type    = string
  default = "admin"
}

variable "dhcp_options_create" {
  type    = string
  default = "false"
}

variable "dhcp_options_server_type" {
  type    = string
  default = "VcnLocalPlusInternet"
}

variable "dhcp_options_domain_names" {
  type    = string
  default = "oraclevcn.com"
}

variable "anywhere_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "oracle_service_label" {
  type    = string
}

variable "oracle_service_ocid" {
  type    = string
}

variable "default_destination_type" {
  type    = string
  default = "CIDR_BLOCK"
}

variable "default_source_type" {
  type    = string
  default = "CIDR_BLOCK"
}

variable "service_destination_type" {
  type    = string
  default = "SERVICE_CIDR_BLOCK"
}

variable "egress_stateless" {
  type    = string
  default = "false"
}

variable "ingress_stateless" {
  type    = string
  default = "false"
}

variable "tcp_protocol" {
  type    = string
  default = "6"
}

variable "udp_protocol" {
  type    = string
  default = "17"
}

variable "icmp_protocol" {
  type    = string
  default = "1"
}

variable "all_protocol" {
  type    = string
  default = "all"
}

variable "icmp_type" {
  type    = string
  default = "3"
}

variable "icmp_code" {
  type    = string
  default = "4"
}

variable "oracle_service_port" {
  type    = string
  default = "443"
}

variable "database_port" {
  type    = string
  default = "1521"
}

variable "ssh_port" {
  type    = string
  default = "22"
}

variable "http_port" {
  type    = string
  default = "80"
}

variable "https_port" {
  type    = string
  default = "443"
}

variable "wls_admin_port" {
  type    = string
  default = "7002"
}

variable "wls_sample_port" {
  type    = string
  default = "8001"
}

variable "db_system_availability_domain" {
  type    = string
  default = "0"
}

variable "db_system_database_edition" {
  type    = string
  default = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
}

variable "db_system_db_version" {
  type    = string
  default = "12.2.0.1"
}

variable "db_system_admin_password" {
  type = string
}

variable "db_system_source" {
  type    = string
  default = "NONE"
}

variable "db_system_character_set" {
  type    = string
  default = "AL32UTF8"
}

variable "db_system_ncharacter_set" {
  type    = string
  default = "AL16UTF16"
}

variable "db_system_auto_backup_enabled" {
  type    = string
  default = "true"
}

variable "db_system_recovery_window_in_days" {
  type    = string
  default = "60"
}

variable "db_system_db_name" {
  type = string
}

variable "db_system_pdb_name" {
  type = string
}

variable "db_system_db_workload" {
  type    = string
  default = "OLTP"
}

variable "db_system_hostname_prefix" {
  type    = string
  default = "dbs"
}

variable "db_system_cluster_name_prefix" {
  type    = string
  default = "clu"
}

variable "db_system_shape" {
  type = string
}

variable "db_system_ssh_public_keys_file" {
  type = string
}

variable "db_system_cpu_core_count" {
  type    = string
  default = "2"
}

variable "db_system_node_count" {
  type = string
}

variable "db_system_data_storage_percentage" {
  type    = string
  default = "80"
}

variable "db_system_data_storage_size_in_gb" {
  type = string
}

variable "db_system_disk_redundancy" {
  type    = string
  default = "HIGH"
}

variable "db_system_license_model" {
  type = string
}

variable "identity_user" {
  type = string
}

variable "identity_password" {
  type = string
}

variable "identity_service_id" {
  type = string
}

variable "java_endpoint" {
  type = string
}

variable "jcs_name_prefix" {
  type = string
}

variable "jcs_ssh_public_key_file" {
  type = string
}

variable "jcs_edition" {
  type = string
}

variable "jcs_service_version" {
  type = string
}

variable "jcs_bring_your_own_license" {
  type = string
}

variable "jcs_shape" {
  type = string
}

variable "jcs_managed_server_count" {
  type = string
}

variable "jcs_cluster_type" {
  type    = string
  default = "APPLICATION_CLUSTER"
}

variable "jcs_database_user" {
  type    = string
  default = "SYS"
}

variable "jcs_admin_user" {
  type    = string
  default = "weblogic"
}

variable "jcs_admin_password" {
  type = string
}

variable "jcs_availability_domain" {
  type    = string
  default = "0"
}

variable "jcs_load_balancing_policy" {
  type    = string
  default = "ROUND_ROBIN"
}

variable "jcs_enable_admin_console" {
  type    = string
  default = "true"
}

variable "jcs_create_lb" {
  type    = string
  default = "true"
}

variable "create_bastion" {
  type    = string
  default = "true"
}

variable "bastion_availability_domain" {
  type    = string
  default = "0"
}

variable "bastion_shape" {
  type    = string
  default = "VM.Standard.E2.1"
}

variable "bastion_operating_system" {
  type    = string
  default = "Oracle Linux"
}

variable "bastion_operating_system_version" {
  type    = string
  default = "7.6"
}

variable "bastion_image_ocid" {
  type    = string
  default = "NONE"
}

variable "bastion_ssh_public_key_file" {
  type = string
}

variable "bastion_hostname_label" {
  type    = string
  default = "bastion"
}

variable "bastion_source_type" {
  type    = string
  default = "image"
}

