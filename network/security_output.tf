output "data_security_list_id" {
  value = "${oci_core_security_list.nw_sl_data.id}"
}

output "app_security_list_id" {
  value = "${oci_core_security_list.nw_sl_app.id}"
}

output "lbaas_security_list_id" {
  value = "${oci_core_security_list.nw_sl_lbaas.id}"
}

output "admin_security_list_id" {
  value = "${oci_core_security_list.nw_sl_admin.id}"
}

