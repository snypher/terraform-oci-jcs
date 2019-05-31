# Create the Object Storage Bucket that will be used for JCS instance backups
resource "oci_objectstorage_bucket" "st_jcs_bucket" {
  compartment_id = "${var.app_compartment_ocid}"
  name           = "ST_Bucket_BackupRestore_JCS_${var.environment}_${var.app_tag}"
  namespace      = "${var.tenancy}"
}

