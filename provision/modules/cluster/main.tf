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

data "databricks_spark_version" "latest" {
  depends_on = [data.azurerm_databricks_workspace.ws]
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  depends_on = [data.azurerm_databricks_workspace.ws]
}

data "databricks_node_type" "smallest" {
  local_disk = true
  depends_on = [data.azurerm_databricks_workspace.ws]
}

resource "databricks_cluster" "prod_cluster" {
  cluster_name            = var.prod_cluster_name
  spark_version           = data.databricks_spark_version.latest.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 4
  }
  lifecycle {
    prevent_destroy = true
  }
}