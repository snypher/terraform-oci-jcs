output "cpt_env_id" {
  value = oci_identity_compartment.cpt_env.id
}

output "cpt_env_name" {
  value = oci_identity_compartment.cpt_env.name
}

output "cpt_network_id" {
  value = oci_identity_compartment.cpt_network.id
}

output "cpt_network_name" {
  value = oci_identity_compartment.cpt_network.name
}

output "cpt_admin_id" {
  value = oci_identity_compartment.cpt_admin.id
}

output "cpt_admin_name" {
  value = oci_identity_compartment.cpt_admin.name
}

output "cpt_shared_id" {
  value = oci_identity_compartment.cpt_shared.id
}

output "cpt_shared_name" {
  value = oci_identity_compartment.cpt_shared.name
}

output "cpt_application_id" {
  value = oci_identity_compartment.cpt_application.id
}

output "cpt_application_name" {
  value = oci_identity_compartment.cpt_application.name
}

output "cpt_database_id" {
  value = oci_identity_compartment.cpt_database.id
}

output "cpt_database_name" {
  value = oci_identity_compartment.cpt_database.name
}

output "group_psm_id" {
  value = oci_identity_group.grp_psm.id
}

output "group_psm_name" {
  value = oci_identity_group.grp_psm.name
}

output "user_jcs_id" {
  value = oci_identity_user.usr_jcs.id
}

output "user_jcs_name" {
  value = oci_identity_user.usr_jcs.name
}

output "user_jcs_token_id" {
  value = oci_identity_auth_token.usr_jcs_token.id
}

output "user_jcs_token" {
  value = oci_identity_auth_token.usr_jcs_token.token
}

output "psm_env_policy_id" {
  value = oci_identity_policy.psm_env_policy.id
}

output "psm_env_policy_name" {
  value = oci_identity_policy.psm_env_policy.name
}

