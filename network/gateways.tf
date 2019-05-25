# Internet gateway for the the primary VCN
resource "oci_core_internet_gateway" "nw_ig" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "NW_InternetGateway_${var.environment}_${var.app_tag}"
  vcn_id         = "${oci_core_vcn.nw_vcn.id}"
}

# NAT gateway for the the primary VCN
resource "oci_core_nat_gateway" "nw_ng" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.nw_vcn.id}"
  display_name   = "NW_NATGateway_${var.environment}_${var.app_tag}"
}

# Service gateway for the primary VCN
resource "oci_core_service_gateway" "nw_sg" {
  compartment_id = "${var.compartment_ocid}"
  services {
    service_id = "${var.oracle_service_ocid}"
  }
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_ServiceGateway_${var.environment}_${var.app_tag}"
}

