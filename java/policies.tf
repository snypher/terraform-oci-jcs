# Provision the object storage bucket access policy
# This needs to be created on the SWIFT API Designated Compartment - which is typcially the
# root compartment
resource "oci_identity_policy" "psm-jcs-policy" {
  provider = "oci.home"

  name           = "IAM_Policy_BackupRestore_JCS_${var.environment}_${var.app_tag}"
  compartment_id = "${var.env_compartment_ocid}"
  description    = "Policy for object storage bucket access from ${var.app_tag} JCS instance in ${var.environment} environment"

  statements = [
    "Allow group ${var.group_psm_name} to manage objects in compartment ${var.app_compartment_name} where target.bucket.name='${oci_objectstorage_bucket.st_jcs_bucket.name}'",
  ]
}

