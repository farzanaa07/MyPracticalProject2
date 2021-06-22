terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 2.46.0"
        }    
    }    
}

 

provider "azurerm" {
    features {}
}
variable "services" {
  description = "List of web apps"
  type        = map
  default     = {
    FrontEnd = {
      name="farzana-app-service"
    },
    NumbersService = {
      name="farzana-numbers"
    },
    ColoursService = {
      name="farzana-colours"
    },
    MergeService = {
      name="farzana-merge"
    },
  }
}

resource "azurerm_resource_group" "rg" {
    name     = "farzana-group"
    location = "uksouth"
}

resource "azurerm_app_service_plan" "app-service-plan" {
  name = "farzana-appserviceplan"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  kind = "Windows"
  reserved = "false"
  sku {
    tier = "Basic"
    size = "B1"
  }
}
resource "azurerm_app_service" "webapp" {
  
   for_each = var.services
    name = each.value.name
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    app_service_plan_id = azurerm_app_service_plan.app-service-plan.id
        site_config{
    dotnet_framework_version = "v5.0"
        }
app_settings ={
"AppSettings__coloursServiceURL" : "https://farzana-colours.azurewebsites.net"
"AppSettings__numbersServiceURL" : "https://farzana-numbers.azurewebsites.net"
"AppSettings__mergedServiceURL" : "http://farzana-merge.azurewebsites.net"
}
}
resource "azurerm_sql_server" "db" {
  name                         = "farzana-server1"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "farzanaakter"
  administrator_login_password = "Cupcakes13"

  tags = {
    project="true"
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = "farzanastorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_sql_database" "sql" {
  name                = "farzana-sql"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.db.name

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.sa.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.sa.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }
  tags = {
    project = "true"
  }
}




