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

data "databricks_group" "devopsgroup" {
  display_name = var.devops_group_name
}

data "databricks_group" "devgroup" {
  display_name = var.dev_group_name
}

data "databricks_group" "testgroup" {
  display_name = var.testers_group_name
}

data "databricks_group" "prodgroup" {
  display_name = var.prod_group_name
}

data "databricks_group" "analystgroup" {
  display_name = var.analyst_group_name
}

data "databricks_group" "engineergroup" {
  display_name = var.engineer_group_name
}

data "databricks_spark_version" "latest" {
  depends_on = [data.azurerm_databricks_workspace.ws]
}

data "databricks_node_type" "smallest" {
  local_disk = true
  depends_on = [data.azurerm_databricks_workspace.ws]
}

data "databricks_clusters" "prod_cluster" {
  cluster_name_contains = var.prod_cluster_name
  depends_on            = [data.azurerm_databricks_workspace.ws]
}

resource "databricks_permissions" "cluster_usage" {
  for_each = data.databricks_clusters.prod_cluster.ids
  cluster_id = each.value
  access_control {
    group_name       = data.databricks_group.devgroup.display_name
    permission_level = "CAN_ATTACH_TO"
  }
  access_control {
    group_name       = data.databricks_group.testgroup.display_name
    permission_level = "CAN_ATTACH_TO"
  }
  access_control {
    group_name       = data.databricks_group.analystgroup.display_name
    permission_level = "CAN_ATTACH_TO"
  }
  access_control {
    group_name       = data.databricks_group.engineergroup.display_name
    permission_level = "CAN_ATTACH_TO"
  }
  access_control {
    group_name       = data.databricks_group.devopsgroup.display_name
    permission_level = "CAN_RESTART"
  }
  access_control {
    group_name       = data.databricks_group.prodgroup.display_name
    permission_level = "CAN_MANAGE"
  }
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [data.azurerm_databricks_workspace.ws]
}