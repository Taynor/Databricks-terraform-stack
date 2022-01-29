variable "location" {
    type = string
}
variable "rgname" {
    type = string
}
variable "wsname" {
    type = string
}
variable "client_id" {
    type = string
}
variable "client_secret" {
    type      = string
    sensitive = true
}
variable "tenant_id" {
    type = string
}
variable "subscription_id" {
    type = string
}
variable "ad_analyst_group" {
    type = string
}
variable "ad_dev_group" {
    type = string
}
variable "ad_devops_group" {
    type = string
}
variable "ad_engineer_group" {
    type = string
}
variable "ad_operations_group" {
    type = string
}
variable "ad_tester_group" {
    type = string
}
variable "analyst_group_name" {
    type = string
}
variable "dev_group_name" {
    type = string
}
variable "devops_group_name" {
    type = string
}
variable "engineer_group_name" {
    type = string
}
variable "prod_group_name" {
    type = string
}
variable "testers_group_name" {
    type = string
}
variable "prod_cluster_name" {
    type = string
}
variable "analyst_notebook_path" {
    type = string
}
variable "dev_notebook_path" {
    type = string
}
variable "devops_notebook_path" {
    type = string
}
variable "engineer_notebook_path" {
    type = string
}
variable "tester_notebook_path" {
    type = string
}
variable "prod_notebook_path" {
    type = string
}
variable "analyst_job_name" {
    type = string
}
variable "dev_job_name" {
    type = string
}
variable "devops_job_name" {
    type = string
}
variable "engineer_job_name" {
    type = string
}
variable "tester_job_name" {
    type = string
}
variable "prod_job_name" {
    type = string
}
variable "analyst_path" {
    type = string
}
variable "dev_path" {
    type = string
}
variable "devops_path" {
    type = string
}
variable "engineer_path" {
    type    = string
}
variable "prod_path" {
    type = string
}
variable "test_path" {
    type = string
}
variable "analyst_users" {
    type = list
}
variable "dev_users" {
    type = list
}
variable "devops_users" {
    type = list 
}
variable "engineer_users" {
    type = list
}
variable "ops_users" {
    type = list
}
variable "tester_users" {
    type = list
}
variable "prod_cluster_policy" {
    type = string
}