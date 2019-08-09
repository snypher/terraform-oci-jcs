output "internet_gateway_id" {
  value = oci_core_internet_gateway.nw_ig.id
}

output "nat_gateway_id" {
  value = oci_core_nat_gateway.nw_ng.id
}

output "service_gateway_id" {
  value = oci_core_service_gateway.nw_sg.id
}

