resource "oci_identity_policy" "psm_env_policy" {
  name           = "IAM_PSM_Policy_${var.environment}_${var.app_tag}"
  description    = "PSM Policy for ${var.app_tag} in ${var.environment} environment"
  compartment_id = "${var.env_compartment_ocid}"

  statements = [
    "Allow service PSM to inspect database-family in compartment ${var.database_compartment_name}",
    "Allow service PSM to inspect autonomous-database in compartment ${var.database_compartment_name}",
    "Allow service PSM to inspect vcns in compartment ${var.network_compartment_name}",
    "Allow service PSM to use subnets in compartment ${var.network_compartment_name}",
    "Allow service PSM to use vnics in compartment ${var.network_compartment_name}",
    "Allow service PSM to manage security-lists in compartment ${var.network_compartment_name}",
  ]
}

