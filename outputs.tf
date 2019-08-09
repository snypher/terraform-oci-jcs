# Outputs from iam module
output "Environment-Parent-Compartment" {
  value = module.iam.cpt_env_name
}

output "Environment-Network-Compartment" {
  value = module.iam.cpt_network_name
}

output "Environment-Admin-Compartment" {
  value = module.iam.cpt_admin_name
}

output "Environment-Shared-Compartment" {
  value = module.iam.cpt_shared_name
}

output "Environment-Application-Compartment" {
  value = module.iam.cpt_application_name
}

output "Environment-Database-Compartment" {
  value = module.iam.cpt_database_name
}

output "PaaS-Services-IAM-Group" {
  value = module.iam.group_psm_name
}

output "JCS-Service-IAM-User-name" {
  value = module.iam.user_jcs_name
}

output "JCS-Service-IAM-User-token" {
  value = module.iam.user_jcs_token
}

output "Environment-IAM-PSM-Policy" {
  value = module.iam.psm_env_policy_name
}

