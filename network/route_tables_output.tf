output "private_route_table_id" {
  value = "${oci_core_route_table.nw_rt_private.id}"
}

output "public_route_table_id" {
  value = "${oci_core_route_table.nw_rt_public.id}"
}

