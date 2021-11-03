terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.9"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.57.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "databricks"{
  host = azurerm_databricks_workspace.this.workspace_url
}

data "databricks_current_user" "me" {
  depends_on = [azurerm_databricks_workspace.this]
}
data "databricks_spark_version" "latest" {
  depends_on = [azurerm_databricks_workspace.this]
}
data "databricks_node_type" "smallest" {
  local_disk = true
}

resource "azurerm_databricks_workspace" "this" {
  name                        = var.workspacename
  resource_group_name         = var.rgname
  location                    = var.location
  sku                         = var.sku
  managed_resource_group_name = var.mrgworkspace
}

data "azurerm_databricks_workspace" "ws" {
  name                = azurerm_databricks_workspace.this.name
  resource_group_name = azurerm_databricks_workspace.this.resource_group_name
}

output "databricks_host" {
  value = "https://${azurerm_databricks_workspace.this.workspace_url}/"
}

output "workspace_id" {
  value = azurerm_databricks_workspace.this.id
}

output "databricks_instance" {
  value = "https://${azurerm_databricks_workspace.this.workspace_url}/"
}

resource "databricks_secret_scope" "this" {
  name = "demo-${data.databricks_current_user.me.alphanumeric}"
}

resource "databricks_token" "pat" {
  comment          = "Created from ${abspath(path.module)}"
  lifetime_seconds = 3600
}

resource "databricks_secret" "token" {
  string_value = databricks_token.pat.token_value
  scope        = databricks_secret_scope.this.name
  key          = "token"
}

resource "databricks_notebook" "this" {
  path     = "${data.databricks_current_user.me.home}/Terraform"
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is a dummy notebook')
    EOT
  )
}

resource "databricks_job" "this" {
  name = "Initial Job (${data.databricks_current_user.me.alphanumeric})"
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest.id
    node_type_id  = data.databricks_node_type.smallest.id
  }

  notebook_task {
    notebook_path = databricks_notebook.this.path
  }

  email_notifications {}
}

resource "databricks_cluster" "this" {
  cluster_name = "Initial Cluster (${data.databricks_current_user.me.alphanumeric})"
  spark_version           = data.databricks_spark_version.latest.id
  instance_pool_id        = databricks_instance_pool.smallest_nodes.id
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 4
  }
}

resource "databricks_cluster_policy" "this" {
  name = "Initial Policy (${data.databricks_current_user.me.alphanumeric})"
  definition = jsonencode({
    "dbus_per_hour" : {
      "type" : "range",
      "maxValue" : 10
    },
    "autotermination_minutes" : {
      "type" : "fixed",
      "value" : 20,
      "hidden" : true
    }
  })
}

resource "databricks_instance_pool" "smallest_nodes" {
  instance_pool_name = "Smallest Nodes (${data.databricks_current_user.me.alphanumeric})"
  min_idle_instances = 0
  max_capacity       = 30
  node_type_id       = data.databricks_node_type.smallest.id
  preloaded_spark_versions = [
    data.databricks_spark_version.latest.id
  ]

  idle_instance_autotermination_minutes = 20
}

output "notebook_url" {
  value = databricks_notebook.this.url
}

output "job_url" {
  value = databricks_job.this.url
}