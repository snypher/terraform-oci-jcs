resource "oci_core_instance" "bastion" {
  availability_domain = "${var.ad_list[var.bastion_availability_domain - 1]}"
  compartment_id      = "${var.compartment_ocid}"
  display_name = "CN_Bastion_${var.environment}_${var.app_tag}"
  create_vnic_details {
    subnet_id      = "${var.bastion_subnet_id}"
    display_name   = "VNIC_${var.bastion_hostname_label}"
    hostname_label = "${var.bastion_hostname_label}"
  }
  metadata {
    ssh_authorized_keys = "${var.bastion_ssh_public_key}"
  }
  shape = "${var.bastion_shape}"
  source_details {
    source_type = "${var.bastion_source_type}"
    source_id   = "${(var.bastion_image_ocid == "NONE") ? data.oci_core_images.bastion_images.images.0.id : var.bastion_image_ocid}"
  }
  timeouts {
    create = "60m"
  }
  count = "${(var.create_bastion == true) ? 1 : 0}"
}

