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

#Uncomment if the groups have been deleted and need to be created
#Otherwise create a new group using the below template
/* resource "databricks_group" "analystgroup" {
  display_name = var.analyst_group_name
}

resource "databricks_group" "devgroup" {
  display_name = var.dev_group_name
}

resource "databricks_group" "devopsgroup" {
  display_name = var.devops_group_name
}

resource "databricks_group" "engineergroup" {
  display_name = var.engineer_group_name
}

resource "databricks_group" "testgroup" {
  display_name = var.testers_group_name
}

resource "databricks_group" "prodgroup" {
  display_name = var.prod_group_name
} */