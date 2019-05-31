output "jcs_status" {
  value = "${oraclepaas_java_service_instance.jcs.status}"
}

#output "jcs_uri" {
#  value = "${oraclepaas_java_service_instance.jcs.uri}"
#}

output "jcs_admin_url" {
  value = "${oraclepaas_java_service_instance.jcs.load_balancer.0.admin_url}"
}

output "jcs_console_url" {
  value = "${oraclepaas_java_service_instance.jcs.load_balancer.0.console_url}"
}

output "jcs_url" {
  value = "${oraclepaas_java_service_instance.jcs.load_balancer.0.url}"
}

