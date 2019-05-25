#######################
### Required Values ###
#######################

# Properties required to authenticate to the OCI API.
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm
tenancy_ocid="YOU-NEED-TO-PUT-HERE-A-VALID-TENANCY-OCID>"
user_ocid="YOU-NEED-TO-PUT-HERE-A-VALID-USER-OCID"
fingerprint="YOU-NEED-TO-PUT-HERE-A-VALID-KEY-FINGERPRINT"
private_key_path="YOU-NEED-TO-PUT-HERE-A-VALID-PRIVATE-KEY-FILE-IN-PEM-FORMAT"
private_key_password="IS-OPTIONAL-TO-USE-A-PRIVATE-KEY-PASSPHRASE-HERE"

# Define the OCI region where we are going to work
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm
home_region="YOU-NEED-TO-PUT-HERE-A-VALID-OCI-REGION"
region="YOU-NEED-TO-PUT-HERE-A-VALID-OCI-REGION"

# A short identifier for the service, which is used as a prefix for naming of compartments and other resources.
app_tag="Demo"

# The environment/grouping to deploye to: test, dev, prod, or uat
environment="dev"

#######################
### Optional Values ###
#######################

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
subnet_app_private="false"
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
# Define the DHCP Options server type to be used by default on each VCN
dhcp_options_server_type="VcnLocalPlusInternet"
# Define the DNS Domain Name to be used as Search Domain by default on each VCN
dhcp_options_domain_names="oraclevcn.com"
# Define the destination CIDR_BLOCK for the anywhere access (usually internet)
anywhere_cidr="0.0.0.0/0"
# Define the destination CIDR label for the oracle services accessed through a service gateway
# Reference:
#  https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/servicegateway.htm
#  https://cloud.oracle.com/networking/service-gateway/supported-services
#  https://docs.cloud.oracle.com/iaas/api/#/en/iaas/latest/Service/ListServices
oracle_service_label="YOU-NEED-TO-PUT-HERE-A-VALID-OCI-SERVICE-CIDR-LABEL"
# Define the OCID for the oracle service type accessed through a service gateway
# Reference:
#  https://docs.cloud.oracle.com/iaas/Content/Network/Tasks/servicegateway.htm
#  https://cloud.oracle.com/networking/service-gateway/supported-services
#  https://docs.cloud.oracle.com/iaas/api/#/en/iaas/latest/Service/ListServices
oracle_service_ocid="YOU-NEED-TO-PUT-HERE-A-VALID-OCI-SERVICE-TYPE-OCID"
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
# Define TCP/22 as the port used for SSH access to the app layer
ssh_port="22"
# Define TCP/80 as the port used for HTTP access to the load balancer layer
http_port="80"
# Define TCP/443 as the port used for SSH access to the load balancer layer
https_port="443"
# Define the Availability Domain where will reside the DB System instance
# Supported Values are: 0, 1 or 2
db_system_availability_domain="2"
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
db_system_db_version="12.2.0.1"
# Define the password for SYS, SYSTEM, PDB Admin and TDE Wallet.
# The password must be at least nine characters and contain at least two uppercase, 
# two lowercase, two numbers, and two special characters. The special characters must be _, #, or -.
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#DefaultOptionsfortheInitialDatabase
db_system_admin_password="YOU-NEED-TO-PUT-HERE-A-STRONG-PASSWORD"
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
db_system_cluster_name_prefix="cl"
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
# Define the SSH public keys to be installed in the DB system public nodes.
# The public key portion of the key pair to use for SSH access to the DB system. Must be in OpenSSH format.
# Multiple public keys can be provided. The length of the combined keys cannot exceed 40,000 characters.
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#Prerequisites
db_system_ssh_public_keys="YOU-NEED-TO-PUT-HERE-A-VALID-PUBLIC-KEY-IN-OPENSSH-FORMAT"
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
# Default value is: LICENSE_INCLUDED
# Reference:
#   https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/launchingDB.htm#ManagingBareMetalandVirtualMachineDBSystems
db_system_license_model="LICENSE_INCLUDED"
