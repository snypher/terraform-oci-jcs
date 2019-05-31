# Create an OCI group for API-only users used by PSM PaaS Services
resource "oci_identity_group" "grp_psm" {
  provider = "oci.home"

  compartment_id = "${var.tenancy_ocid}"
  description    = "PSM PaaS Service Backups Group"
  name           = "GRP_PSM_${var.app_tag}_${var.environment}"
}

# Add the JCS API-only user into the PSM PaaS Service Users Group
resource "oci_identity_user_group_membership" "grp_psm_jcs" {
  provider = "oci.home"

  group_id = "${oci_identity_group.grp_psm.id}"
  user_id  = "${oci_identity_user.usr_jcs.id}"
}

