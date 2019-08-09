variable "tenancy_ocid" {}

variable "compartment_ocid" {}

# Used in naming the resources.
variable "app_tag" {}

# Used in naming the resources.
variable "environment" {}

variable "vcn_cidr" {}

variable "subnet_data_cidr" {}

variable "subnet_data_private" {}

variable "subnet_data_dnslabel" {}

variable "subnet_app_cidr" {}

variable "subnet_app_private" {}

variable "subnet_app_dnslabel" {}

variable "subnet_lbaas_cidr" {}

variable "subnet_lbaas_private" {}

variable "subnet_lbaas_dnslabel" {}

variable "subnet_admin_cidr" {}

variable "subnet_admin_private" {}

variable "subnet_admin_dnslabel" {}

variable "dhcp_options_create" {}

variable "dhcp_options_server_type" {}

variable "dhcp_options_domain_names" {}

variable "anywhere_cidr" {}

variable "oracle_service_label" {}

variable "oracle_service_ocid" {}

variable "default_destination_type" {}

variable "default_source_type" {}

variable "service_destination_type" {}

variable "egress_stateless" {}

variable "ingress_stateless" {}

variable "tcp_protocol" {}

variable "icmp_protocol" {}

variable "udp_protocol" {}

variable "all_protocol" {}

variable "icmp_type" {}

variable "icmp_code" {}

variable "oracle_service_port" {}

variable "database_port" {}

variable "ssh_port" {}

variable "http_port" {}

variable "https_port" {}

variable "wls_admin_port" {}

variable "wls_sample_port" {}

variable "jcs_create_lb" {}

