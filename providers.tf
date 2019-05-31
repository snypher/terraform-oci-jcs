# Configure the Oracle Cloud Infrastructure (OCI) provider with an API Key
provider "oci" {
  alias = "home"
  version = ">= 3.0.0"
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region = "${var.home_region}"
}

provider "oci" {
  version = ">= 3.0.0"
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region = "${var.region}"
}

# Oracle PaaS provider
provider "oraclepaas" {
  user            = "${var.identity_user}"
  password        = "${var.identity_password}"
  identity_domain = "${var.identity_service_id}"
  java_endpoint   = "${var.java_endpoint}"
}

