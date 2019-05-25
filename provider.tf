# Configure the Oracle Cloud Infrastructure provider with an API Key
#provider "oci" {
#  alias = "home"
#  version = ">= 3.0.0"
#  tenancy_ocid = "${var.tenancy_ocid}"
#  user_ocid = "${var.user_ocid}"
#  fingerprint = "${var.fingerprint}"
#  private_key_path = "${var.private_key_path}"
#  region = "${var.home_region}"
#}

provider "oci" {
  version = ">= 3.0.0"
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region = "${var.region}"
}
