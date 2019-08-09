resource "oci_identity_compartment" "cpt_env" {
  provider = "oci.home"
  #compartment_id = "${var.compartment_ocid}"
  description = "The parent compartment for all ${var.environment} environment"
  name        = "CPT_${var.environment}"
  enable_delete = false
}

resource "oci_identity_compartment" "cpt_network" {
  provider = "oci.home"
  compartment_id = "${oci_identity_compartment.cpt_env.id}"
  description = "The network compartment for ${var.app_tag} project in ${var.environment} environment"
  name        = "CPT_${var.environment}_network"
  enable_delete = false
}

resource "oci_identity_compartment" "cpt_admin" {
  provider = "oci.home"
  compartment_id = "${oci_identity_compartment.cpt_env.id}"
  description = "The admin compartment for ${var.app_tag} project in ${var.environment} environment"
  name        = "CPT_${var.environment}_admin"
  enable_delete = false
}

resource "oci_identity_compartment" "cpt_shared" {
  provider = "oci.home"
  compartment_id = "${oci_identity_compartment.cpt_env.id}"
  description = "The shared services compartment for ${var.app_tag} project in ${var.environment} environment"
  name        = "CPT_${var.environment}_shared"
  enable_delete = false
}

resource "oci_identity_compartment" "cpt_application" {
  provider = "oci.home"
  compartment_id = "${oci_identity_compartment.cpt_env.id}"
  description = "The application compartment for ${var.app_tag} project in ${var.environment} environment"
  name        = "CPT_${var.environment}_application"
  enable_delete = false
}

resource "oci_identity_compartment" "cpt_database" {
  provider = "oci.home"
  compartment_id = "${oci_identity_compartment.cpt_env.id}"
  description = "The database compartment for ${var.app_tag} project in ${var.environment} environment"
  name        = "CPT_${var.environment}_database"
  enable_delete = false
}

