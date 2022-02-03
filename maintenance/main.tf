terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.7"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.94.0"
    }
  }
}

module "workspace_group_membership" {
  source              = "./modules/workspace_group_membership"
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  wsname              = var.wsname
  rgname              = var.rgname
  analyst_group_name  = var.analyst_group_name
  dev_group_name      = var.dev_group_name
  devops_group_name   = var.devops_group_name
  engineer_group_name = var.engineer_group_name
  testers_group_name  = var.testers_group_name
  prod_group_name     = var.prod_group_name
  dev_users           = var.dev_users
  devops_users        = var.devops_users
  ops_users           = var.ops_users
  tester_users        = var.tester_users
}

module "ad_group_membership" {
  source              = "./modules/ad_group_membership"
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  wsname              = var.wsname
  rgname              = var.rgname
  analyst_group_name  = var.analyst_group_name  
  dev_group_name      = var.dev_group_name
  devops_group_name   = var.devops_group_name
  engineer_group_name = var.engineer_group_name
  testers_group_name  = var.testers_group_name
  prod_group_name     = var.prod_group_name
  ad_analyst_group    = var.ad_analyst_group
  ad_dev_group        = var.ad_dev_group
  ad_devops_group     = var.ad_devops_group
  ad_engineer_group   = var.ad_engineer_group
  ad_operations_group = var.ad_operations_group
  ad_tester_group     = var.ad_tester_group
}

module "cluster_configuration" {
  source              = "./modules/cluster_configuration"
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  wsname              = var.wsname
  rgname              = var.rgname
  prod_cluster_policy = var.prod_cluster_policy
}