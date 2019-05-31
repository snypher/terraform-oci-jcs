output "dbsystem_jcs_id" {
  value = "${oci_database_db_system.db_system_jcs.id}"
}

output "dbsystem_jcs_hostname" {
  value = "${oci_database_db_system.db_system_jcs.hostname}"
}

output "dbsystem_jcs_pdb_name" {
  value = "${oci_database_db_system.db_system_jcs.db_home.0.database.0.pdb_name}"
}

