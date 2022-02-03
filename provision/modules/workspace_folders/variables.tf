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
variable "analyst_path" {
    type    = string
}
variable "dev_path" {
    type    = string
}
variable "devops_path" {
    type    = string
}
variable "engineer_path" {
    type    = string
}
variable "prod_path" {
    type    = string
}
variable "test_path" {
    type    = string
}