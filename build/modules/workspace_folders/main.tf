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

resource "databricks_directory" "dev" {
  path = var.dev_path
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_directory" "test" {
  path = var.test_path
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_directory" "prod" {
  path = var.prod_path
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_directory" "devops" {
  path = var.devops_path
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_directory" "analyst" {
  path = var.analyst_path
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_directory" "engineer" {
  path = var.engineer_path
  lifecycle {
    prevent_destroy = true
  }
}