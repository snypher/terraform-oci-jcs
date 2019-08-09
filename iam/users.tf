# Create the OCI API-only user to access Object Storage Bucket for JCS backups
resource "oci_identity_user" "usr_jcs" {
  #provider = "oci.home"

  compartment_id = "${var.tenancy_ocid}"
  description    = "API-only user for ${var.app_tag} JCS instance in ${var.environment} environment"
  name = "USR_JCS_${var.app_tag}_${var.environment}"
}

# Define the capabilities for the JCS OCI API-only user
resource "oci_identity_user_capabilities_management" "usr_jcs" {
  #provider = "oci.home"
  user_id  = "${oci_identity_user.usr_jcs.id}"

  can_use_api_keys             = true
  can_use_auth_tokens          = true
  can_use_console_password     = false
  can_use_customer_secret_keys = false
  can_use_smtp_credentials     = false
}

# Create the Auth Token (swift password) for the OCI API-only user
resource "oci_identity_auth_token" "usr_jcs_token" {
  #provider = "oci.home"

  description = "Auth Token (swift auth) to access object storage service for JCS service backups"
  user_id     = "${oci_identity_user.usr_jcs.id}"
}

