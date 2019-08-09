# Route Table for private subnets
resource "oci_core_route_table" "nw_rt_private" {
  compartment_id = "${var.compartment_ocid}"
  route_rules {
    network_entity_id = "${oci_core_nat_gateway.nw_ng.id}"
    destination = "${var.anywhere_cidr}"
    destination_type = "${var.default_destination_type}"
  }
  route_rules {
    network_entity_id = "${oci_core_service_gateway.nw_sg.id}"
    destination = "${var.oracle_service_label}"
    destination_type = "${var.service_destination_type}"
  }
  vcn_id = "${oci_core_vcn.nw_vcn.id}"
  display_name = "NW_Private_RouteTable_${var.environment}_${var.app_tag}"
}

# Default route table used for public subnets
resource "oci_core_default_route_table" "nw_default_rt_public" {
  manage_default_resource_id = "${oci_core_vcn.nw_vcn.default_route_table_id}"
  route_rules {
    network_entity_id = "${oci_core_internet_gateway.nw_ig.id}"
    destination = "${var.anywhere_cidr}"
    destination_type = "${var.default_destination_type}"
  }
  display_name = "NW_Default_RouteTable_${var.environment}_${var.app_tag}"
}

