# Default DCHP Options for the primary VCN
resource "oci_core_dhcp_options" "nw_dhcp_opt" {
  compartment_id = "${var.compartment_ocid}"
  options {
    type = "DomainNameServer"
    server_type = "${var.dhcp_options_server_type}"
  }
  options {
    type = "SearchDomain"
    search_domain_names = [ "${var.dhcp_options_domain_names}" ]
  }
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_DHCPOptions_${var.environment}_${var.app_tag}"
  count = "${(var.dhcp_options_create == true) ? 1 : 0}"
}

