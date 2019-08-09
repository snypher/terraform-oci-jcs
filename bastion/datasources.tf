data "oci_core_images" "bastion_images" {
  compartment_id           = var.tenancy_ocid
  operating_system         = var.bastion_operating_system
  operating_system_version = var.bastion_operating_system_version
  shape                    = var.bastion_shape
  state                    = "AVAILABLE"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

data "template_file" "ad_names" {
  count = length(
    data.oci_identity_availability_domains.ads.availability_domains,
  )
  template = data.oci_identity_availability_domains.ads.availability_domains[count.index]["name"]
}

