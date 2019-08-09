output "jcs_priv_status" {
  value = "${oraclepaas_java_service_instance.jcs_priv.*.status}"
}

output "jcs_priv_admin_url" {
  value = "${oraclepaas_java_service_instance.jcs_priv.*.load_balancer.0.admin_url}"
}

output "jcs_priv_console_url" {
  value = "${oraclepaas_java_service_instance.jcs_priv.*.load_balancer.0.console_url}"
}

output "jcs_priv_url" {
  value = "${oraclepaas_java_service_instance.jcs_priv.*.load_balancer.0.url}"
}

output "jcs_pub_status" {
  value = "${oraclepaas_java_service_instance.jcs_pub.*.status}"
}

