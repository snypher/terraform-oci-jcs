###########################################
### Required Values & IAM Module Values ###
###########################################

# Properties required to authenticate to the OCI API.
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm
tenancy_ocid="INSERT_HERE_YOUR_OCI_TENANT_OCID"
tenancy="INSERT_HERE_YOUR_CLOUD_ACCOUNT_NAME"
user_ocid="INSERT_HERE_YOUR_OCI_USER_OCID"
fingerprint="INSERT_HERE_YOUR_RSA_KEY_FINGERPRINT"
private_key_path="INSERT_HERE_THE_FULL_PATH_OF_YOUR_RSA_PRIVATE_KEY_FILE"
private_key_password=""

# See region info at https://docs.us-phoenix-1.oraclecloud.com/Content/General/Concepts/regions.htm
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm
home_region="INSERT_HERE_YOUR_OCI_HOME_REGION"
region="INSERT_HERE_THE_OCI_REGION_WHERE_YOU_WANT_TO_PROVISION_OCI_RESOURCES"

# A short identifier for the project/application, which is used as a prefix for naming of all resources.
app_tag="Demo"

# The environment/grouping to deploy to: test, dev, prod, or uat
environment="dev"

#############################
### Network Module Values ###
#############################

# Network topology is based on following Oracle Cloud Solutions
# Learn about setting up the infrastructure and platform resources for Java EE applications
#   https://docs.oracle.com/en/solutions/learn-topology-for-java-apps/index.html#GUID-237E7157-41D9-46DC-A4A6-C015E0A39981
# Learn about creating a secure network topology on Oracle Cloud Infrastructure
#   https://docs.oracle.com/en/solutions/learn-secure-network-topology/index.html#GUID-1119D16E-AF9F-4C7F-816B-C19FCAAEA70D
# Create a multitier network topology on Oracle Cloud Infrastructure
#   https://docs.oracle.com/en/solutions/multi-tenant-topology-using-terraform/index.html#GUID-6979792A-E9D0-476A-9728-4BBEB666B11A

# See variables.tf for additional variables that can be set.

# Define the base CIDR for the VCN.
vcn_cidr="192.168.1.0/24"
# Define the base CIDR for the data layer subnet
subnet_data_cidr="192.168.1.16/28"
# Define the type of data layer subnet
# A true value will define the subnet as private
# A false value will define the subnet as public
subnet_data_private="true"
# Define the DNS label used for the data layer subnet
subnet_data_dnslabel="data"
# Define the base CIDR for the app layer subnet
subnet_app_cidr="192.168.1.32/28"
# Define the type of app layer subnet
# A true value will define the subnet as private
# A false value will define the subnet as public
subnet_app_private="true"
# Define the DNS label used for the app layer subnet
subnet_app_dnslabel="app"
# Define the base CIDR for the load balancer layer subnet
subnet_lbaas_cidr="192.168.1.48/28"
# Define the type of load balancer layer subnet
# A true value will define the subnet as private
# A false value will define the subnet as public
subnet_lbaas_private="false"
# Define the DNS label used for the load balancer layer subnet
subnet_lbaas_dnslabel="lbaas"
# Define the base CIDR for the admin layer subnet
subnet_admin_cidr="192.168.1.64/28"
# Define the type of admin layer subnet
# A true value will define the subnet as private
# A false value will define the subnet as public
subnet_admin_private="false"
# Define the DNS label used for the load balancer layer subnet
subnet_admin_dnslabel="admin"
# Define if an additional DHCP Options will be created to be used with a custom configuration
# Valid values are: true or false
# Default value is: false
dhcp_options_create="false"
# Define the DHCP Options server type to be used by default on each VCN
dhcp_options_server_type="VcnLocalPlusInternet"
# Define the DNS Domain Name to be used as Search Domain by default on each VCN
dhcp_options_domain_names="oraclevcn.com"
# Define the destination CIDR_BLOCK for the anywhere access (usually internet)
anywhere_cidr="0.0.0.0/0"
# Define the destination CIDR label for the oracle services accessed through a service gateway
# For example: you can point to all IAD (Asburn) region services through the VCN service gateway
#   CIDR label: all-iad-services-in-oracle-services-network
# Reference:
#  https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/servicegateway.htm
#  https://cloud.oracle.com/networking/service-gateway/supported-services
#  https://docs.cloud.oracle.com/iaas/api/#/en/iaas/latest/Service/ListServices
oracle_service_label="INSERT_HERE_THE_ORACLE_SERVICE_CIDR_LABEL_YOU_WOULD_LIKE_TO_USE"
# Define the OCID for the oracle service type accessed through a service gateway
# By default we will point all IAD (Asburn) region services through the VCN service gateway
# Reference:
#  https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/servicegateway.htm
#  https://cloud.oracle.com/networking/service-gateway/supported-services
#  https://docs.cloud.oracle.com/iaas/api/#/en/iaas/latest/Service/ListServices
oracle_service_ocid="INSERT_HERE_THE_OCID_OF_THE_SERVICE_TYPE_RELATED_WITH_THE_ORACLE_SERVICE_CIDR_LABEL"
# Define the default destination type for route rules and security rules
default_destination_type="CIDR_BLOCK"
# Define the default source type for route rules and security rules
default_source_type="CIDR_BLOCK"
# Define the service destination type for route rules
service_destination_type="SERVICE_CIDR_BLOCK"
# Define if staless behaviour will be used for security egress rules
egress_stateless="false"
# Define if staless behaviour will be used for security ingress rules
ingress_stateless="false"
# Define the transport protocols used for security list rules (ingress or egress)
# Supported values are: 1=ICMP, 6=TCP, 17=UDP
tcp_protocol="6"
icmp_protocol="1"
udp_protocol="17"
all_protocol="all"
# Define the default ICMP types and codes that will be enabled on security lists for public subnets
# Based in Default Security List documentation reference
#   https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm#default-list
icmp_type="3"
icmp_code="4"
# Define TCP/443 as the port used to access Oracle Cloud Services
oracle_service_port="443"
# Define TCP/1521 as the port used to access Oracle Databases on data Layer
database_port="1521"
# Define TCP/22 as the port used for SSH access to the any private layer
ssh_port="22"
# Define TCP/80 as the port used for HTTP access to the load balancer layer
http_port="80"
# Define TCP/443 as the port used for SSH access to the load balancer layer
https_port="443"

##############################
### Database Module Values ###
##############################

# Define the Availability Domain where will reside the DB System instance
# Supported Values are: 1, 2 or 3
db_system_availability_domain="3"
# Define the Oracle Database Edition that applies to all the databases on the DB system
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#editionsandversions
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/DbSystemSummary
# Suported Values are:
#   STANDARD_EDITION
#   ENTERPRISE_EDITION
#   ENTERPRISE_EDITION_HIGH_PERFORMANCE
#   ENTERPRISE_EDITION_EXTREME_PERFORMANCE ** Required for 2-node RAC cluster
db_system_database_edition="ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
# Define the database version to be used on the first db home created on the DB system
# Default value is 18.0.0.0
# The values we could use are:
#   11.2.0.4
#   12.1.0.2
#   12.2.0.1
#   18.0.0.0
# Referecence:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
#   https://docs.cloud.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/db/version/list.html
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/DbVersionSummary/ListDbVersions
db_system_db_version="12.2.0.1.190416"
# Define the password for SYS, SYSTEM, PDB Admin and TDE Wallet.
# The password must be at least nine characters and contain at least two uppercase, 
# two lowercase, two numbers, and two special characters. The special characters must be _, #, or -.
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#DefaultOptionsfortheInitialDatabase
db_system_admin_password="INSERT_HERE_A_STRONG_PASSWORD_FOR_DB_SYS_USER"
# Define the source used for first database created on the DB system.
# We always use NONE because we are creating new databases
db_system_source="NONE"
# Define the character set toi be used for the first database created on the DB system
# Default value is AL32UTF8
# Reference for supported values:
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/CreateDatabaseDetails
db_system_character_set="AL32UTF8"
# Define the national character set to be used for the first database created on the DB system
# Default value is AL16UTF16
# Reference for supported values:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/CreateDatabaseDetails
db_system_ncharacter_set="AL16UTF16"
# Define if automtic backups is enabled for the first databases created on the DB system
# Supported values are: true or false
# Default value is: true
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/backingup.htm
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/DbBackupConfig
db_system_auto_backup_enabled="true"
# Define the retention period for automatic backups
# Retention period: Number of days between the current and the earliest point of recoverability covered by automatic backups.
# This value applies to automatic backups only.
# Default value is 60 days
# Minimun value is 1 days
# Maximun values is 60 days
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/backingupOS.htm
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/DbBackupConfig
db_system_recovery_window_in_days="60"
# Define the name to be used for the first database created on the DB system
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
db_system_db_name="DBJCS"
# Define the name to be used for the first PDB created on the first DB system's database
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
db_system_pdb_name="PDBJCS"
# Define the workload type to be used for the first database created on the DB system
# Default type is OLTP (On-Line Transaction Processing)
# Supported values are: OLTP or DSS
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/CreateDatabaseDetails
db_system_db_workload="OLTP"
# Define a prefix for the hostname of the DB system.
# The final hostname will be a concatenation of this prefix with the environment and app_tag variable
# The hostname must begin with an alphabetic character, and can contain alphanumeric characters and hyphens (-)
# The maximum length of the hostname is 16 characters
db_system_hostname_prefix="dbs"
# Define a prefix for the RAC cluster name of the DB system
# The final cluster name will be a concatenation of this prefix with the environment and app_tag variable
# Valid only for Exadata and 2-node RAC virtual machine DB systems
# The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted.
# The cluster name can be no longer than 11 characters and is not case sensitive
db_system_cluster_name_prefix="c"
# Define the shape for the DB System
# The shape determines resources allocated to the DB system:
#   - For virtual machine shapes, the number of CPU cores and memory
#   - For bare metal and Exadata shapes, the number of CPU cores, memory, and storage
# Default value is: VM.Standard2.2
# Reference for supported values:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#BareMetalandVirtualMachineDBSystems
#   https://docs.cloud.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/db/system-shape/list.html
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/DbSystemShapeSummary/ListDbSystemShapes
db_system_shape="VM.Standard2.2"
# Define the SSH public key file to be installed in the DB system public nodes.
# The public key portion of the key pair to use for SSH access to the DB system. Must be in OpenSSH format.
# Multiple public keys can be provided. The length of the combined keys cannot exceed 40,000 characters.
# The input file could include one public key per line
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#Prerequisites
db_system_ssh_public_keys_file="INSERT_HERE_THE_FULL_PATH_OF_YOUR_SSH_PUBLIC_KEY_FILE_IN_OPENSSH_FORMAT"
# Define number of CPU cores to enable for a bare metal or Exadata DB system
# The service ignores this value when a VM shape is specified.
# The valid values depend on the specified shape:
# Default values is: 2
# Reference for supported values:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#BareMetalandVirtualMachineDBSystems
#   https://docs.cloud.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/db/system-shape/list.html
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/DbSystemShapeSummary/ListDbSystemShapes
db_system_cpu_core_count="2"
# Define the number of nodes to launch for a 2-node RAC virtual machine DB system
# Supported values are: 1 or 2
# Default value is: 2
# Valid only for virtual machine DB system
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#BareMetalandVirtualMachineDBSystems
db_system_node_count="2"
# Define the percentage assigned to DATA storage (user data and database files).
# The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups).
# Supported values are: 80 or 40
# Default value is: 80
# Not applicable for virtual machine DB systems.
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#baremetal
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#virtualmachine
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
db_system_data_storage_percentage="80"
# Define the size (in GB) of the initial data volume that will be created and attached to a virtual machine DB system
# You can scale up storage after provisioning, as needed. 
# Note that the total storage size attached will be more than the amount you specify to allow for REDO/RECO space and software volume.
# Default value is: 256
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#baremetal
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#virtualmachine
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#console
db_system_data_storage_size_in_gb="256"
# Define the type of redundancy configured for the DB system.
# This is only valid for Bare Metal DB systems
# Normal is 2-way redundancy, recommended for test and development systems.
# High is 3-way redundancy, recommended for production systems.
# Default values is: HIGH
# Supported values are: NORMAL or HIGH
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/overview.htm#baremetal
#   https://docs.cloud.oracle.com/iaas/api/#/en/database/20160918/datatypes/DbSystemSummary
db_system_disk_redundancy="HIGH"
# Define the Oracle license model that applies to all the databases on the DB system.
# Supported values are: LICENSE_INCLUDED or BRING_YOUR_OWN_LICENSE
# Default value is: BRING_YOUR_OWN_LICENSE
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#ManagingBareMetalandVirtualMachineDBSystems
db_system_license_model="BRING_YOUR_OWN_LICENSE"

##########################
### Java Module Values ###
##########################

# Properties required to authenticate to the Oracle PaaS API
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jsrmr/obtain-account-information.html
#   https://docs.oracle.com/en/cloud/paas/identity-cloud/uaids/find-your-oracle-identity-cloud-service-tenant-name.html
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jsrmr/SendRequests.html
identity_user="INSERT_HERE_YOUR_IDCS_USERNAME"
identity_password="INSERT_HERE_YOUR_IDCS_USER_PASSWORD"
identity_service_id="INSERT_HERE_YOUR_IDENTITY_SERVICE_ID"
java_endpoint="INSERT_HERE_THE_REST_ENDPOINT_FOR_JAVA_CLOUD_SERVICE"

# Define the Java Cloud Service (JCS) instance name prefix
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-53F70C60-65B2-47D7-8549-4F63DE797ECE
jcs_name_prefix="JCS"

# Define the edition for the service instance.
# Possible values are SE, EE, or SUITE
# References:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-53F70C60-65B2-47D7-8549-4F63DE797ECE
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/oracle-java-cloud-service.html#GUID-5BEB5C7A-DAEE-40C6-BDE0-819E10D62848
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#edition
jcs_edition="SUITE"

# Define the Oracle WebLogic Server software version
# Valid values are: 12cRelease213, 12cRelease212, 12cR3, or 11gR1
# References:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/oracle-java-cloud-service.html#GUID-D0068D72-9546-4FE0-8972-ECE29D39122C
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-53F70C60-65B2-47D7-8549-4F63DE797ECE
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#service_version
jcs_service_version="12cRelease213"

# Define if BYOL will be used as the Oracle license model for Java Cloud Service (JCS) instance
# Supported values are: true or false
# Reference:
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#bring_your_own_license
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-53F70C60-65B2-47D7-8549-4F63DE797ECE
jcs_bring_your_own_license="true"

# Define the Availability Domain where will reside the Java Cloud Service (JCS) instance
# Supported Values are: 1, 2 or 3
jcs_availability_domain="3"
 
# Define the SSH public key file to be installed in the Java Cloud Service (JCS) instance.
# The public key portion of the key pair to use for SSH access to the JCS. Must be in OpenSSH format.
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-490B5301-22F3-4C4D-AE21-B84C99BF3EF3
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#ssh_public_key
jcs_ssh_public_key_file="INSERT_HERE_THE_FULL_PATH_OF_YOUR_SSH_PUBLIC_KEY_FILE_IN_OPENSSH_FORMAT"

# Define the desired compute shape
# The shape determines the number of CPUs, amount of memory, and other resources allocated to a newly created instance.
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-66E6C3B5-35EA-47ED-B32D-064FBDA950C6
#   https://docs.cloud.oracle.com/iaas/Content/Compute/References/computeshapes.htm
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#shape
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#shape-2
jcs_shape="VM.Standard2.2"

# Define the initial number of Managed Servers that you want to provision in this service instance
# Supported values are: 1, 2, 4
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-66E6C3B5-35EA-47ED-B32D-064FBDA950C6
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#server_count
jcs_managed_server_count="2"

# Define the Weblogic Cluster Type to create
# Valid values are APPLICATION_CLUSTER or CACHING_CLUSTER
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-66E6C3B5-35EA-47ED-B32D-064FBDA950C6
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#type
jcs_cluster_type="APPLICATION_CLUSTER"

# Define the username for the database administrator
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-FBDD3699-7CBB-4D7B-B10A-62ADEC7BEE25
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#database
jcs_database_user="SYS"

# Define the username for the WebLogic Server Administrator
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-490B5301-22F3-4C4D-AE21-B84C99BF3EF3
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#admin
jcs_admin_user="weblogic"

# Define the password for the WebLogic Server Administrator
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-490B5301-22F3-4C4D-AE21-B84C99BF3EF3
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#admin
jcs_admin_password="INSERT_HERE_A_STRONG_PASSWORD_FOR_WEBLOGIC_SERVER_ADMINISTRATOR"

# Define the policy to use for routing requests to the origin servers of the Oracle managed load balancer
# Valid values are LEAST_CONN, IP_HASH, or ROUND_ROBIN
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/design-considerations-oracle-java-cloud-service-instance.html#GUID-65723358-1B23-4EDB-811D-7DE5FCF254F5
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-D5DB9693-8E24-4CC7-8717-CA70C78B1552
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#load_balancer
jcs_load_balancing_policy="ROUND_ROBIN"

# Flag that specifies whether to enable (true) or disable (false) the access rules that control external communication 
# to the WebLogic Server Administration Console, Fusion Middleware Control, and Load Balancer Consol
# Default value is: true
# Reference:
#   https://docs.oracle.com/en/cloud/paas/java-cloud/jscug/create-custom-oracle-java-cloud-service-instance-oci.html#GUID-66E6C3B5-35EA-47ED-B32D-064FBDA950C6
#   https://www.terraform.io/docs/providers/oraclepaas/r/oraclepaas_java_service_instance.html#enable_admin_console
jcs_enable_admin_console="true"

##############################
#### Bastion Module Values ###
##############################

# Define if a compute instance for bastion-admin tasks will be created or not
# The compute instance will be created on the admin subnet
# Valid values are: true or false
# Default value: true
create_bastion="true"

# Define the compute shape that will be used for the bastion-admin instance
# Valid values are defined by the "shape" attribute of the OCI Compute supported shapes
# References:
#   https://docs.cloud.oracle.com/iaas/Content/Compute/References/computeshapes.htm
#   https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/Shape/
#   https://docs.cloud.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/compute/shape/list.html
bastion_shape="VM.Standard.E2.1"

# Define the source type to use for creation of the bastion-admin compute instance
# Valid values are: image or bootVolume
# Default value is: image
# Reference:
#   https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/datatypes/InstanceSourceDetails
#   https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/datatypes/InstanceSourceViaImageDetails
#   https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/datatypes/InstanceSourceViaBootVolumeDetails
bastion_source_type="image"

# Define the Operating System for the bastion-admin compute instance
# Valid values are defined by the "operatingSystem" attribute of the OCI Compute images available
# A custom image can be used too
# References:
#   https://docs.cloud.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/compute/image.html
#   https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/Image/
#   https://docs.cloud.oracle.com/iaas/Content/Compute/References/images.htm
#   https://docs.cloud.oracle.com/iaas/Content/Compute/References/bringyourownimage.htm
#   https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/managingcustomimages.htm
#   https://www.terraform.io/docs/providers/oci/d/core_images.html
bastion_operating_system="Oracle Linux"

# Define the Operating System version for the bastion-admin compute instance
# Valid values are defined by the "operatingSystemVersion" attribute of the OCI Compute Image selected
# References:
#   https://docs.cloud.oracle.com/iaas/api/#/en/iaas/20160918/Image/
#   https://docs.cloud.oracle.com/iaas/tools/oci-cli/latest/oci_cli_docs/cmdref/compute/image/list.html
bastion_operating_system_version="7.6"

# Define the OCID for the custom image or the OCI marketplace provided image used for the bastion-admin compute instance
# References:
#   https://docs.cloud.oracle.com/iaas/Content/Compute/References/bringyourownimage.htm
#   https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/managingcustomimages.htm
#   https://docs.cloud.oracle.com/iaas/Content/Marketplace/Tasks/workingwithlistings.htm
bastion_image_ocid="NONE"

# Define the SSH public key file that will be installed in the bastion-admin compute instance
# References:
#   https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/managingkeypairs.htm
bastion_ssh_public_key_file="INSERT_HERE_THE_FULL_PATH_OF_YOUR_SSH_PUBLIC_KEY_FILE_IN_OPENSSH_FORMAT"

# Define the Availability Domain where will reside the bastion compute instance
# Supported Values are: 1, 2 or 3
bastion_availability_domain="3"

# Define the hostname (short part) of the bastion-admin compute instance
# References:
#   https://docs.cloud.oracle.com/iaas/Content/Compute/Concepts/instancemanagement.htm
#   https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/dns.htm
bastion_hostname_label="bastion-priv" 
