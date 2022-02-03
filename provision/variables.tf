variable "rgname" {
    description = <<EOF
    "The name of resource group that the databricks workspace instance is hosted. 
    A shared variable for all child modules to authenticate against the workspace."
    EOF
    type        = string
}
variable "wsname" {
    description = <<EOF
    "The name of the databricks workspace instance. 
    A shared variable for all child modules to authenticate against the workspace."
    EOF
    type        = string
}
variable "client_id" {
    description = <<EOF
    "The service principal client id, authentication for the azurerm and databricks providers. 
    A shared variable for all child modules to authenticate against the workspace."
    EOF
    type        = string
}
variable "client_secret" {
    description = <<EOF
    "The service principal secret, authentication for the azurerm and databricks providers.
    A shared variable for all child modules to authenticate against the workspace."
    EOF
    type        = string
    sensitive   = true
}
variable "tenant_id" {
    description = <<EOF
    "The service principal tenamt id, authentication for the azurerm and databricks providers.
    A shared variable for all child modules to authenticate against the workspace."
    EOF
    type        = string
}
variable "subscription_id" {
    description = ""
    type        = string
}
variable "ad_analyst_group" {
    description = ""
    type        = string
}
variable "ad_dev_group" {
    description = ""
    type        = string
}
variable "ad_devops_group" {
    description = ""
    type        = string
}
variable "ad_engineer_group" {
    description = ""
    type        = string
}
variable "ad_operations_group" {
    description = ""
    type        = string
}
variable "ad_tester_group" {
    description = ""
    type        = string
}
variable "analyst_group_name" {
    description = ""
    type        = string
}
variable "dev_group_name" {
    description = ""
    type        = string
}
variable "devops_group_name" {
    description = ""
    type        = string
}
variable "engineer_group_name" {
    description = ""
    type        = string
}
variable "prod_group_name" {
    description = ""
    type        = string
}
variable "testers_group_name" {
    description = ""
    type        = string
}
variable "prod_cluster_name" {
    description = ""
    type        = string
}
variable "analyst_notebook_path" {
    description = ""
    type        = string
}
variable "dev_notebook_path" {
    description = ""
    type        = string
}
variable "devops_notebook_path" {
    description = ""
    type        = string
}
variable "engineer_notebook_path" {
    description = ""
    type        = string
}
variable "tester_notebook_path" {
    description = ""
    type        = string
}
variable "prod_notebook_path" {
    description = ""
    type        = string
}
variable "analyst_job_name" {
    description = ""
    type        = string
}
variable "dev_job_name" {
    description = ""
    type        = string
}
variable "devops_job_name" {
    description = ""
    type        = string
}
variable "engineer_job_name" {
    description = ""
    type        = string
}
variable "tester_job_name" {
    description = ""
    type        = string
}
variable "prod_job_name" {
    description = ""
    type        = string
}
variable "analyst_path" {
    description = ""
    type        = string
}
variable "dev_path" {
    description = ""
    type        = string
}
variable "devops_path" {
    description = ""
    type        = string
}
variable "engineer_path" {
    description = ""
    type        = string
}
variable "prod_path" {
    description = ""
    type        = string
}
variable "test_path" {
    description = ""
    type        = string
}
variable "analyst_users" {
    description = ""
    type = list
}
variable "dev_users" {
    description = ""
    type = list
}
variable "devops_users" {
    description = ""
    type = list 
}
variable "engineer_users" {
    description = ""
    type = list
}
variable "ops_users" {
    description = ""
    type = list
}
variable "tester_users" {
    description = ""
    type = list
}