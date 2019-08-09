# Base module to create default IAM resources:
# - The comparments to create the logic resource separation of the multi-tier architecture
# - The IAM policy for PSM access to the environment compartment
# - The IAM users and groups that will be used for the Java Cloud Service (JCS) instance
module "iam" {
  source       = "./iam"
  tenancy_ocid = var.tenancy_ocid
  app_tag      = var.app_tag
  environment  = var.environment
}

# Network module to create the resources required for multi-tier architecture
# - Multiple subnets, security lists, route tabes and gateways to replicate 
#   security best practices of a multi-tier architecture
module "network" {
  source                    = "./network"
  tenancy_ocid              = var.tenancy_ocid
  compartment_ocid          = module.iam.cpt_network_id
  app_tag                   = var.app_tag
  environment               = var.environment
  vcn_cidr                  = var.vcn_cidr
  subnet_data_cidr          = var.subnet_data_cidr
  subnet_data_private       = var.subnet_data_private
  subnet_data_dnslabel      = var.subnet_data_dnslabel
  subnet_app_cidr           = var.subnet_app_cidr
  subnet_app_private        = var.subnet_app_private
  subnet_app_dnslabel       = var.subnet_app_dnslabel
  subnet_lbaas_cidr         = var.subnet_lbaas_cidr
  subnet_lbaas_private      = var.subnet_lbaas_private
  subnet_lbaas_dnslabel     = var.subnet_lbaas_dnslabel
  subnet_admin_cidr         = var.subnet_admin_cidr
  subnet_admin_private      = var.subnet_admin_private
  subnet_admin_dnslabel     = var.subnet_admin_dnslabel
  dhcp_options_create       = var.dhcp_options_create
  dhcp_options_server_type  = var.dhcp_options_server_type
  dhcp_options_domain_names = "${lower(format("%s", var.environment))}.${var.dhcp_options_domain_names}"
  anywhere_cidr             = var.anywhere_cidr
  oracle_service_label      = var.oracle_service_label
  oracle_service_ocid       = var.oracle_service_ocid
  default_destination_type  = var.default_destination_type
  default_source_type       = var.default_source_type
  service_destination_type  = var.service_destination_type
  egress_stateless          = var.egress_stateless
  ingress_stateless         = var.ingress_stateless
  tcp_protocol              = var.tcp_protocol
  icmp_protocol             = var.icmp_protocol
  udp_protocol              = var.udp_protocol
  all_protocol              = var.all_protocol
  icmp_type                 = var.icmp_type
  icmp_code                 = var.icmp_code
  oracle_service_port       = var.oracle_service_port
  database_port             = var.database_port
  ssh_port                  = var.ssh_port
  http_port                 = var.http_port
  https_port                = var.https_port
  wls_admin_port            = var.wls_admin_port
  wls_sample_port           = var.wls_sample_port
  jcs_create_lb             = var.jcs_create_lb
}

# Database module to create the DB system required for the JCS instance
# The DB system will reside in the database compartment
module "database" {
  source                            = "./database"
  tenancy_ocid                      = var.tenancy_ocid
  compartment_ocid                  = module.iam.cpt_database_id
  app_tag                           = var.app_tag
  environment                       = var.environment
  ad_list                           = data.template_file.ad_names.*.rendered
  db_system_availability_domain     = var.db_system_availability_domain
  db_system_database_edition        = var.db_system_database_edition
  db_system_db_version              = var.db_system_db_version
  db_system_admin_password          = var.db_system_admin_password
  db_system_source                  = var.db_system_source
  db_system_character_set           = var.db_system_character_set
  db_system_ncharacter_set          = var.db_system_ncharacter_set
  db_system_auto_backup_enabled     = var.db_system_auto_backup_enabled
  db_system_recovery_window_in_days = var.db_system_recovery_window_in_days
  db_system_db_name                 = var.db_system_db_name
  db_system_pdb_name                = var.db_system_pdb_name
  db_system_db_workload             = var.db_system_db_workload
  db_system_subnet_id               = module.network.data_subnet_id
  db_system_hostname_prefix         = var.db_system_hostname_prefix

  #db_system_hostname = "${var.db_system_hostname_prefix}-${var.environment}-${var.app_tag}"
  db_system_hostname            = "${var.db_system_hostname_prefix}-${var.app_tag}"
  db_system_cluster_name_prefix = var.db_system_cluster_name_prefix

  #db_system_cluster_name = "${var.db_system_cluster_name_prefix}-${var.environment}-${var.app_tag}"
  db_system_cluster_name            = "${var.db_system_cluster_name_prefix}-${var.app_tag}"
  db_system_shape                   = var.db_system_shape
  db_system_ssh_public_keys         = file(var.db_system_ssh_public_keys_file)
  db_system_cpu_core_count          = var.db_system_cpu_core_count
  db_system_node_count              = var.db_system_node_count
  db_system_data_storage_percentage = var.db_system_data_storage_percentage
  db_system_data_storage_size_in_gb = var.db_system_data_storage_size_in_gb
  db_system_disk_redundancy         = var.db_system_disk_redundancy
  db_system_license_model           = var.db_system_license_model
}

# Java module to create the JCS instance required for this environment
# The JCS instance will reside in the application compartment
module "java" {
  source                      = "./java"
  tenancy_ocid                = var.tenancy_ocid
  tenancy                     = var.tenancy
  region                      = var.region
  env_compartment_ocid        = module.iam.cpt_env_id
  env_compartment_name        = module.iam.cpt_env_name
  app_compartment_ocid        = module.iam.cpt_application_id
  app_compartment_name        = module.iam.cpt_application_name
  app_tag                     = var.app_tag
  environment                 = var.environment
  ad_list                     = data.template_file.ad_names.*.rendered
  identity_user               = var.identity_user
  identity_password           = var.identity_password
  identity_service_id         = var.identity_service_id
  java_endpoint               = var.java_endpoint
  group_psm_name              = module.iam.group_psm_name
  jcs_name                    = "${var.jcs_name_prefix}${title(format("%s", var.app_tag))}${upper(format("%s", var.environment))}"
  jcs_availability_domain     = var.jcs_availability_domain
  jcs_edition                 = var.jcs_edition
  jcs_service_version         = var.jcs_service_version
  jcs_bring_your_own_license  = var.jcs_bring_your_own_license
  jcs_ssh_public_key          = file(var.jcs_ssh_public_key_file)
  jcs_subnet_id               = module.network.app_subnet_id
  jcs_shape                   = var.jcs_shape
  jcs_managed_server_count    = var.jcs_managed_server_count
  jcs_cluster_type            = var.jcs_cluster_type
  jcs_database_user           = var.jcs_database_user
  jcs_database_password       = var.db_system_admin_password
  jcs_admin_user              = var.jcs_admin_user
  jcs_admin_password          = var.jcs_admin_password
  jcs_storage_username        = module.iam.user_jcs_name
  jcs_storage_user_token      = module.iam.user_jcs_token
  jcs_load_balancing_policy   = var.jcs_load_balancing_policy
  jcs_load_balancer_subnet_id = module.network.lbaas_subnet_id
  jcs_enable_admin_console    = var.jcs_enable_admin_console
  jcs_create_lb               = var.jcs_create_lb
  dbsystem_jcs_hostname       = module.database.dbsystem_jcs_hostname
  dbsystem_jcs_pdb_name       = module.database.dbsystem_jcs_pdb_name
  dbsystem_subnet_domain_name = module.network.data_subnet_domain_name
}

module "bastion" {
  source                           = "./bastion"
  tenancy_ocid                     = var.tenancy_ocid
  region                           = var.region
  compartment_ocid                 = module.iam.cpt_admin_id
  app_tag                          = var.app_tag
  environment                      = var.environment
  #ad_list                          = data.template_file.ad_names.*.rendered
  create_bastion                   = var.create_bastion
  bastion_availability_domain      = var.bastion_availability_domain
  bastion_shape                    = var.bastion_shape
  bastion_operating_system         = var.bastion_operating_system
  bastion_operating_system_version = var.bastion_operating_system_version
  bastion_image_ocid               = var.bastion_image_ocid
  bastion_subnet_id                = module.network.admin_subnet_id
  bastion_ssh_public_key           = file(var.bastion_ssh_public_key_file)
  bastion_hostname_label           = var.bastion_hostname_label
  bastion_source_type              = var.bastion_source_type
}

