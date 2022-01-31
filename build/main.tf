terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.6"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.93.0"
    }
  }
}

provider "azurerm" {
  features {}  
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

provider "databricks" {
  host                = data.azurerm_databricks_workspace.ws.workspace_url
  azure_client_id     = var.client_id
  azure_client_secret = var.client_secret
  azure_tenant_id     = var.tenant_id
}

data "azurerm_databricks_workspace" "ws" {
  name                = var.wsname
  resource_group_name = var.rgname
}

#Must be commented out unless creating a new group
module "workspace_groups" {
  source              = "./modules/workspace_groups"
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
}

module "workspace_users" {
  source              = "./modules/workspace_users"
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
  analyst_users       = var.analyst_users
  dev_users           = var.dev_users
  devops_users        = var.devops_users
  engineer_users      = var.engineer_users
  ops_users           = var.ops_users
  tester_users        = var.tester_users
}

module "ad_group_users" {
  source              = "./modules/ad_group_users"
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  wsname              = var.wsname
  rgname              = var.rgname
  ad_analyst_group    = var.ad_analyst_group
  ad_dev_group        = var.ad_dev_group
  ad_devops_group     = var.ad_devops_group
  ad_engineer_group   = var.ad_engineer_group
  ad_operations_group = var.ad_operations_group
  ad_tester_group     = var.ad_tester_group
}

module "ad_group_members" {
  source              = "./modules/ad_group_members"
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

module "jobs" {
  source                 = "./modules/jobs"
  client_id              = var.client_id
  client_secret          = var.client_secret
  tenant_id              = var.tenant_id
  subscription_id        = var.subscription_id
  wsname                 = var.wsname
  rgname                 = var.rgname
  analyst_notebook_path  = var.analyst_notebook_path
  dev_notebook_path      = var.dev_notebook_path
  devops_notebook_path   = var.devops_notebook_path
  engineer_notebook_path = var.engineer_notebook_path
  tester_notebook_path   = var.tester_notebook_path
  prod_notebook_path     = var.prod_notebook_path
  analyst_job_name       = var.analyst_job_name
  dev_job_name           = var.dev_job_name
  devops_job_name        = var.devops_job_name
  engineer_job_name      = var.engineer_job_name
  tester_job_name        = var.tester_job_name
  prod_job_name          = var.prod_job_name
}

module "jobs_permissions" {
  source                 = "./modules/jobs_permissions"
  client_id              = var.client_id
  client_secret          = var.client_secret
  tenant_id              = var.tenant_id
  subscription_id        = var.subscription_id
  wsname                 = var.wsname
  rgname                 = var.rgname
  analyst_notebook_path  = var.analyst_notebook_path
  dev_notebook_path      = var.dev_notebook_path
  devops_notebook_path   = var.devops_notebook_path
  engineer_notebook_path = var.engineer_notebook_path
  tester_notebook_path   = var.tester_notebook_path
  prod_notebook_path     = var.prod_notebook_path
  analyst_job_name       = var.analyst_job_name
  dev_job_name           = var.dev_job_name
  devops_job_name        = var.devops_job_name
  engineer_job_name      = var.engineer_job_name
  tester_job_name        = var.tester_job_name
  prod_job_name          = var.prod_job_name
  analyst_group_name     = var.analyst_group_name
  dev_group_name         = var.dev_group_name
  devops_group_name      = var.devops_group_name
  engineer_group_name    = var.engineer_group_name
  testers_group_name     = var.testers_group_name
  prod_group_name        = var.prod_group_name
}

module "notebooks" {
  source                 = "./modules/notebooks"
  client_id              = var.client_id
  client_secret          = var.client_secret
  tenant_id              = var.tenant_id
  subscription_id        = var.subscription_id
  wsname                 = var.wsname
  rgname                 = var.rgname
  analyst_notebook_path  = var.analyst_notebook_path
  dev_notebook_path      = var.dev_notebook_path
  devops_notebook_path   = var.devops_notebook_path
  engineer_notebook_path = var.engineer_notebook_path
  tester_notebook_path   = var.tester_notebook_path
  prod_notebook_path     = var.prod_notebook_path
}

module "workspace_folders" {
  source          = "./modules/workspace_folders"
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  wsname          = var.wsname
  rgname          = var.rgname
  analyst_path    = var.analyst_path
  dev_path        = var.dev_path
  devops_path     = var.devops_path
  engineer_path   = var.engineer_path
  prod_path       = var.prod_path
  test_path       = var.test_path
}

module "workspace_folders_permissions" {
  source              = "./modules/workspace_folders_permissions"
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  wsname              = var.wsname
  rgname              = var.rgname
  analyst_path        = var.analyst_path
  dev_path            = var.dev_path
  devops_path         = var.devops_path
  engineer_path       = var.engineer_path
  prod_path           = var.prod_path
  test_path           = var.test_path
  analyst_group_name  = var.analyst_group_name
  dev_group_name      = var.dev_group_name
  devops_group_name   = var.devops_group_name
  engineer_group_name = var.engineer_group_name
  testers_group_name  = var.testers_group_name
  prod_group_name     = var.prod_group_name
}

module "cluster" {
  source              = "./modules/cluster"
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  wsname              = var.wsname
  rgname              = var.rgname
  prod_cluster_name   = var.prod_cluster_name
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

module "cluster_permissions" {
  source              = "./modules/cluster_permissions"
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
  prod_cluster_name   = var.prod_cluster_name
}