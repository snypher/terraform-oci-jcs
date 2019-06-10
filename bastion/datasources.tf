data "oci_core_images" "bastion_images" {
  compartment_id = "${var.tenancy_ocid}"
  operating_system = "${var.bastion_operating_system}"
  operating_system_version = "${var.bastion_operating_system_version}"
  shape = "${var.bastion_shape}"
  state = "AVAILABLE"
}

