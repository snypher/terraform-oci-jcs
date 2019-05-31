output "user_jcs_id" {
  value = "${oci_identity_user.usr_jcs.id}"
}

output "user_jcs_name" {
  value = "${oci_identity_user.usr_jcs.name}"
}

output "user_jcs_token_id" {
  value = "${oci_identity_auth_token.usr_jcs_token.id}"
}

output "user_jcs_token" {
  value = "${oci_identity_auth_token.usr_jcs_token.token}"
}

