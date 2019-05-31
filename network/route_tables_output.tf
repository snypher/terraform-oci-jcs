output "private_route_table_id" {
  value = "${oci_core_route_table.nw_rt_private.id}"
}

output "default_route_table_id" {
  value = "${oci_core_default_route_table.nw_default_rt_public.id}"
}

