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