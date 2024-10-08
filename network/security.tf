# Security List for Data subnet
resource "oci_core_security_list" "nw_sl_data" {
  compartment_id = "${var.compartment_ocid}"
  egress_security_rules = [
    {
      destination = "${var.oracle_service_label}"
      protocol = "${var.tcp_protocol}"
      destination_type = "${var.service_destination_type}"
      stateless = "${var.egress_stateless}"
      tcp_options {
        max = "${var.oracle_service_port}"
        min = "${var.oracle_service_port}"
      }
    }
  ]
  ingress_security_rules = [
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.subnet_app_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.database_port}"
        min = "${var.database_port}"
      }
    },
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.subnet_admin_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.ssh_port}"
        min = "${var.ssh_port}"
      }
    },
    {
      protocol = "${var.icmp_protocol}"
      source = "${var.vcn_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
    }
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_SecurityList_data_${var.environment}_${var.app_tag}"
}

# Security List for App subnet 
resource "oci_core_security_list" "nw_sl_app" {
  compartment_id = "${var.compartment_ocid}"
  egress_security_rules = [
    {
      destination = "${var.oracle_service_label}"
      protocol = "${var.tcp_protocol}"
      destination_type = "${var.service_destination_type}"
      stateless = "${var.egress_stateless}"
      tcp_options {
        max = "${var.oracle_service_port}"
        min = "${var.oracle_service_port}"
      }
    },
    {
      destination = "${var.subnet_data_cidr}"
      protocol = "${var.tcp_protocol}"
      destination_type = "${var.default_destination_type}"
      stateless = "${var.egress_stateless}"
      tcp_options {
        max = "${var.database_port}"
        min = "${var.database_port}"
      }
    }
  ]
  ingress_security_rules = [
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.subnet_lbaas_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
    },
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.subnet_admin_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.ssh_port}"
        min = "${var.ssh_port}"
      }
    },
    {
      protocol = "${var.icmp_protocol}"
      source = "${var.vcn_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
    }
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_SecurityList_app_${var.environment}_${var.app_tag}"
}

# Security List for admin subnet
resource "oci_core_security_list" "nw_sl_admin" {
  compartment_id = "${var.compartment_ocid}"
  egress_security_rules = [
    {
      destination = "${var.vcn_cidr}"
      protocol = "${var.all_protocol}"
      destination_type = "${var.default_destination_type}"
      stateless = "${var.egress_stateless}"
    }
  ]
  ingress_security_rules = [
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.vcn_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.https_port}"
        min = "${var.https_port}"
      }
    },
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.vcn_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.http_port}"
        min = "${var.http_port}"
      }
    }
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_SecurityList_admin_${var.environment}_${var.app_tag}"
}

# Security List for LBaaS subnet 
resource "oci_core_security_list" "nw_sl_lbaas" {
  compartment_id = "${var.compartment_ocid}"
  egress_security_rules = [
    {
      destination = "${var.vcn_cidr}"
      protocol = "${var.all_protocol}"
      destination_type = "${var.default_destination_type}"
      stateless = "${var.egress_stateless}"
    }
  ]
  ingress_security_rules = [
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.anywhere_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.http_port}"
        min = "${var.http_port}"
      }
    },
    {
      protocol = "${var.tcp_protocol}"
      source = "${var.anywhere_cidr}"
      source_type = "${var.default_source_type}"
      stateless = "${var.ingress_stateless}"
      tcp_options {
        max = "${var.https_port}"
        min = "${var.https_port}"
      }
    }
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_SecurityList_lbaas_${var.environment}_${var.app_tag}"
}

