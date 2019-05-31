# Create the virtual DB system that will be used for JCS infrastructure schemas
# The DB system will reside in the database compartment
resource "oci_database_db_system" "db_system_jcs" {
  availability_domain = "${var.ad_list[var.db_system_availability_domain - 1]}"
  compartment_id = "${var.compartment_ocid}"
  database_edition = "${var.db_system_database_edition}"
  db_home {
    database {
      admin_password = "${var.db_system_admin_password}"
      character_set = "${var.db_system_character_set}"
      db_backup_config {
        auto_backup_enabled = "${var.db_system_auto_backup_enabled}"
        recovery_window_in_days = "${var.db_system_recovery_window_in_days}"
      }
      db_name = "${var.db_system_db_name}"
      db_workload = "${var.db_system_db_workload}"
      ncharacter_set = "${var.db_system_ncharacter_set}"
      pdb_name = "${var.db_system_pdb_name}"
    }
    db_version = "${var.db_system_db_version}"
    display_name = "DB_Home_JCS_${var.environment}_${var.app_tag}"
  }
  subnet_id = "${var.db_system_subnet_id}"
  hostname = "${lower(format("%s", var.db_system_hostname))}"
  shape = "${var.db_system_shape}"
  ssh_public_keys = ["${var.db_system_ssh_public_keys}"]
  cluster_name = "${lower(format("%s", var.db_system_cluster_name))}"
  #cpu_core_count = "${var.db_system_cpu_core_count}"
  data_storage_percentage = "${var.db_system_data_storage_percentage}"
  data_storage_size_in_gb = "${var.db_system_data_storage_size_in_gb}"
  disk_redundancy = "${var.db_system_disk_redundancy}"
  display_name = "DB_System_JCS_${var.environment}_${var.app_tag}"
  license_model = "${var.db_system_license_model}"
  node_count = "${var.db_system_node_count}"
  source = "${var.db_system_source}"
  lifecycle {
    ignore_changes = [
      "db_home.0.database.0.admin_password",
      "cpu_core_count"
    ]
  }
}

