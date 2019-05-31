# Subnet for data services layer
resource "oci_core_subnet" "nw_sn_data" {
  cidr_block = "${var.subnet_data_cidr}"
  compartment_id = "${var.compartment_ocid}"
  security_list_ids = [
    "${oci_core_security_list.nw_sl_data.id}", 
    "${oci_core_vcn.nw_vcn.default_security_list_id}"
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  dhcp_options_id = "${oci_core_vcn.nw_vcn.default_dhcp_options_id}"
  display_name = "NW_Subnet_Data_${var.environment}_${var.app_tag}"
  dns_label = "${var.subnet_data_dnslabel}"
  prohibit_public_ip_on_vnic = "${var.subnet_data_private}"
  route_table_id = "${oci_core_route_table.nw_rt_private.id}"
}

# Subnet for app services layer
resource "oci_core_subnet" "nw_sn_app" {
  cidr_block = "${var.subnet_app_cidr}"
  compartment_id = "${var.compartment_ocid}"
  security_list_ids = [
    "${oci_core_security_list.nw_sl_app.id}", 
    "${oci_core_vcn.nw_vcn.default_security_list_id}"
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  dhcp_options_id = "${oci_core_vcn.nw_vcn.default_dhcp_options_id}"
  display_name = "NW_Subnet_App_${var.environment}_${var.app_tag}"
  dns_label = "${var.subnet_app_dnslabel}"
  prohibit_public_ip_on_vnic = "${var.subnet_app_private}"
  route_table_id = "${oci_core_route_table.nw_rt_private.id}"
}

# Subnet for lbaas services layer
resource "oci_core_subnet" "nw_sn_lbaas" {
  cidr_block = "${var.subnet_lbaas_cidr}"
  compartment_id = "${var.compartment_ocid}"
  security_list_ids = [
    "${oci_core_security_list.nw_sl_lbaas.id}",
    "${oci_core_vcn.nw_vcn.default_security_list_id}"
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  dhcp_options_id = "${oci_core_vcn.nw_vcn.default_dhcp_options_id}"
  display_name = "NW_Subnet_LBaaS_${var.environment}_${var.app_tag}"
  dns_label = "${var.subnet_lbaas_dnslabel}"
  prohibit_public_ip_on_vnic = "${var.subnet_lbaas_private}"
  route_table_id = "${oci_core_vcn.nw_vcn.default_route_table_id}"
}

# Subnet for admin services layer
resource "oci_core_subnet" "nw_sn_admin" {
  cidr_block = "${var.subnet_admin_cidr}"
  compartment_id = "${var.compartment_ocid}"
  security_list_ids = [
    "${oci_core_security_list.nw_sl_admin.id}",
    "${oci_core_vcn.nw_vcn.default_security_list_id}"
  ]
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  dhcp_options_id = "${oci_core_vcn.nw_vcn.default_dhcp_options_id}"
  display_name = "NW_Subnet_Admin_${var.environment}_${var.app_tag}"
  dns_label = "${var.subnet_admin_dnslabel}"
  prohibit_public_ip_on_vnic = "${var.subnet_admin_private}"
  route_table_id = "${oci_core_vcn.nw_vcn.default_route_table_id}"
}

