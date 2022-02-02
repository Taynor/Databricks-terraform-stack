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

data "databricks_notebook" "devnotebook" {
  path   = var.dev_notebook_path
  format = "SOURCE"
}

data "databricks_notebook" "devopsnotebook" {
  path   = var.devops_notebook_path
  format = "SOURCE"
}

data "databricks_notebook" "testernotebook" {
  path   = var.tester_notebook_path
  format = "SOURCE"
}

data "databricks_notebook" "prodnotebook" {
  path   = var.prod_notebook_path
  format = "SOURCE"
}

data "databricks_notebook" "analystnotebook" {
  path   = var.analyst_notebook_path
  format = "SOURCE"
}

data "databricks_notebook" "engineernotebook" {
  path   = var.engineer_notebook_path
  format = "SOURCE"
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  depends_on = [data.azurerm_databricks_workspace.ws]
}

data "databricks_node_type" "smallest" {
  local_disk = true
  depends_on = [data.azurerm_databricks_workspace.ws]
}

resource "databricks_job" "devjob" {
  name = var.dev_job_name
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest_lts.id
    node_type_id  = data.databricks_node_type.smallest.id
  }
  notebook_task {
    notebook_path = data.databricks_notebook.devnotebook.path
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_job" "devopsjob" {
  name = var.devops_job_name
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest_lts.id
    node_type_id  = data.databricks_node_type.smallest.id
  }
  notebook_task {
    notebook_path = data.databricks_notebook.devopsnotebook.path
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_job" "testerjob" {
  name = var.tester_job_name
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest_lts.id
    node_type_id  = data.databricks_node_type.smallest.id
  }
  notebook_task {
    notebook_path = data.databricks_notebook.testernotebook.path
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_job" "prodjob" {
  name = var.prod_job_name
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest_lts.id
    node_type_id  = data.databricks_node_type.smallest.id
  }
  notebook_task {
    notebook_path = data.databricks_notebook.prodnotebook.path
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_job" "analystjob" {
  name = var.analyst_job_name
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest_lts.id
    node_type_id  = data.databricks_node_type.smallest.id
  }
  notebook_task {
    notebook_path = data.databricks_notebook.analystnotebook.path
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_job" "engineerjob" {
  name = var.engineer_job_name
  new_cluster {
    num_workers   = 1
    spark_version = data.databricks_spark_version.latest_lts.id
    node_type_id  = data.databricks_node_type.smallest.id
  }
  notebook_task {
    notebook_path = data.databricks_notebook.engineernotebook.path
  }
  lifecycle {
    prevent_destroy = true
  }
}