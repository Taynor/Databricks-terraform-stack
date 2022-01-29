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

/* data "databricks_group" "devopsgroup" {
  display_name = var.devops_group_name
}

data "databricks_group" "devgroup" {
  display_name = var.devops_group_name
}

data "databricks_group" "testgroup" {
  display_name = var.testers_group_name
}

data "databricks_group" "prodgroup" {
  display_name = var.prod_group_name
} */

resource "databricks_user" "analyst_users" {
  for_each  = toset(var.analyst_users) 
  user_name = each.value
  force     = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "databricks_user" "dev_users" {
  for_each  = toset(var.dev_users) 
  user_name = each.value
  force     = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "databricks_user" "devops_users" {
  for_each  = toset(var.devops_users) 
  user_name = each.value
  force     = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "databricks_user" "engineer_users" {
  for_each  = toset(var.engineer_users) 
  user_name = each.value
  force     = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "databricks_user" "ops_users" {
  for_each  = toset(var.ops_users) 
  user_name = each.value
  force     = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "databricks_user" "tester_users" {
  for_each  = toset(var.tester_users) 
  user_name = each.value
  force     = true
  lifecycle {
    create_before_destroy = true
  }
}

/* resource "databricks_group_member" "devops_members" {
  for_each   = toset(var.devops_users)
  group_id   = data.databricks_group.devopsgroup.id
  member_id  = databricks_user.devops_users[each.key].id
  depends_on = [databricks_user.devops_users]
}

resource "databricks_group_member" "dev_members" {
  for_each   = toset(var.dev_users)
  group_id   = data.databricks_group.devgroup.id
  member_id  = databricks_user.dev_users[each.key].id
  depends_on = [databricks_user.dev_users]
}

resource "databricks_group_member" "ops_members" {
  for_each   = toset(var.ops_users)
  group_id   = data.databricks_group.prodgroup.id
  member_id  = databricks_user.ops_users[each.key].id
  depends_on = [databricks_user.ops_users]
}

resource "databricks_group_member" "tester_members" {
  for_each   = toset(var.tester_users)
  group_id   = data.databricks_group.testgroup.id
  member_id  = databricks_user.tester_users[each.key].id
  depends_on = [databricks_user.tester_users]
} */