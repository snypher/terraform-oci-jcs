# Primary VCN resource for this environment
resource "oci_core_vcn" "nw_vcn" {
  cidr_block     = "${var.vcn_cidr}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "NW_VCN_${var.environment}_${var.app_tag}"
  dns_label      = "${lower(format("%s", var.environment))}"
}

