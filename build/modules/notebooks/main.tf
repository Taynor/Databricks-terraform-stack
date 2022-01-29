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

resource "databricks_notebook" "devnotebook" {
  path     = var.dev_notebook_path
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is the Development job notebook')
    EOT
  )
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_notebook" "devopsnotebook" {
  path     = var.devops_notebook_path
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is the DevOps job notebook')
    EOT
  )
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_notebook" "testernotebook" {
  path     = var.tester_notebook_path
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is the Tester job notebook')
    EOT
  )
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_notebook" "prodnotebook" {
  path     = var.prod_notebook_path
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is the Operations job notebook')
    EOT
  )
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_notebook" "analystnotebook" {
  path     = var.analyst_notebook_path
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is the Analyst job notebook')
    EOT
  )
  lifecycle {
    prevent_destroy = true
  }
}

resource "databricks_notebook" "engineernotebook" {
  path     = var.engineer_notebook_path
  language = "PYTHON"
  content_base64 = base64encode(<<-EOT
    print(f'This is the Engineer job notebook')
    EOT
  )
  lifecycle {
    prevent_destroy = true
  }
}