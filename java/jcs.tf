# Create the Java Cloud Service (JCS) instance for this environment
# The JCS instance will reside in the application compartment
resource "oraclepaas_java_service_instance" "jcs" {
  name = "${var.jcs_name}"
  description = "Java Cloud Service (JCS) instance for ${var.environment} environment ${var.app_tag} project"
  edition = "${var.jcs_edition}"
  service_version = "${var.jcs_service_version}"
  bring_your_own_license = "${var.jcs_bring_your_own_license}"
  enable_admin_console = "${var.jcs_enable_admin_console}"
  ssh_public_key = "${var.jcs_ssh_public_key}"
  region = "${var.region}"
  availability_domain = "${var.ad_list[var.jcs_availability_domain - 1]}"
  subnet = "${var.jcs_subnet_id}"
  weblogic_server {
    shape = "${var.jcs_shape}"
    cluster {
      shape = "${var.jcs_shape}"
      name = "JCS_Cluster_${var.environment}_${var.app_tag}"
      server_count = "${var.jcs_managed_server_count}"
      type = "${var.jcs_cluster_type}"
    }
    connect_string = "//${var.dbsystem_jcs_hostname}-scan.${var.dbsystem_subnet_domain_name}:1521/${var.dbsystem_jcs_pdb_name}.${var.dbsystem_subnet_domain_name}"
    database {
      username = "${var.jcs_database_user}"
      password = "${var.jcs_database_password}"
    }
    admin {
      username = "${var.jcs_admin_user}"
      password = "${var.jcs_admin_password}"
    }
  }
  backups {
    cloud_storage_container = "https://swiftobjectstorage.${var.region}.oraclecloud.com/v1/${var.tenancy}/${oci_objectstorage_bucket.st_jcs_bucket.name}"
    cloud_storage_username  = "${var.jcs_storage_username}"
    cloud_storage_password  = "${var.jcs_storage_user_token}"
  }
  load_balancer {
    load_balancing_policy = "${var.jcs_load_balancing_policy}"
    subnets = ["${var.jcs_load_balancer_subnet_id}"]
  }
}

