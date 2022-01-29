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
variable "prod_notebook_path" {
    type = string
}
variable "tester_notebook_path" {
    type = string
}