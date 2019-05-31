output "data_subnet_id" {
  value = "${oci_core_subnet.nw_sn_data.id}"
}

output "data_subnet_domain_name" {
  value = "${oci_core_subnet.nw_sn_data.subnet_domain_name}"
}

output "app_subnet_id" {
  value = "${oci_core_subnet.nw_sn_app.id}"
}

output "app_subnet_domain_name" {
  value = "${oci_core_subnet.nw_sn_app.subnet_domain_name}"
}

output "lbaas_subnet_id" {
  value = "${oci_core_subnet.nw_sn_lbaas.id}"
}

output "lbaas_subnet_domain_name" {
  value = "${oci_core_subnet.nw_sn_lbaas.subnet_domain_name}"
}

output "admin_subnet_id" {
  value = "${oci_core_subnet.nw_sn_admin.id}"
}

output "admin_subnet_domain_name" {
  value = "${oci_core_subnet.nw_sn_admin.subnet_domain_name}"
}

