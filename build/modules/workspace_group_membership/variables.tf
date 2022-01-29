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
variable "rgname" {
    type = string
}
variable "wsname" {
    type = string
}
variable "devops_users" {
    type    = list 
}
variable "dev_users" {
    type    = list
}
variable "ops_users" {
    type    = list
}
variable "tester_users" {
    type    = list
}
variable "analyst_group_name" {
  type = string
}
variable "dev_group_name" {
    type    = string
}
variable "devops_group_name" {
    type    = string
}
variable "engineer_group_name" {
    type    = string
}
variable "prod_group_name" {
    type    = string
}
variable "testers_group_name" {
    type    = string
}