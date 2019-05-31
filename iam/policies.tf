resource "oci_identity_policy" "psm_env_policy" {
  provider = "oci.home"
  name           = "IAM_Policy_PSM_${var.environment}_${var.app_tag}"
  description    = "PSM Policy for ${var.app_tag} in ${var.environment} environment"
  compartment_id = "${oci_identity_compartment.cpt_env.id}"

  statements = [
    "Allow service PSM to inspect database-family in compartment ${oci_identity_compartment.cpt_env.name}",
    "Allow service PSM to inspect autonomous-database in compartment ${oci_identity_compartment.cpt_env.name}",
    "Allow service PSM to inspect vcns in compartment ${oci_identity_compartment.cpt_env.name}",
    "Allow service PSM to use subnets in compartment ${oci_identity_compartment.cpt_env.name}",
    "Allow service PSM to use vnics in compartment ${oci_identity_compartment.cpt_env.name}",
    "Allow service PSM to manage security-lists in compartment ${oci_identity_compartment.cpt_env.name}",
  ]
}

