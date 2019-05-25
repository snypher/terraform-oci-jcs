output "data_subnet_id" {
  value = "${oci_core_subnet.nw_sn_data.id}"
}

output "app_subnet_id" {
  value = "${oci_core_subnet.nw_sn_app.id}"
}

output "lbaas_subnet_id" {
  value = "${oci_core_subnet.nw_sn_lbaas.id}"
}

output "admin_subnet_id" {
  value = "${oci_core_subnet.nw_sn_admin.id}"
}

