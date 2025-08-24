locals {
  common_tags = {
    managed_by  = "Terraform"
    owner       = "Dev_team"
    environment = "Dev"
  }
}
module "rg" {
  source      = "../../Module/RG"
  rg_name     = "rg_dev"
  rg_location = "West Europe"
  rg_tags = local.common_tags

}

module "acr" {
  source   = "../../Module/ACR"
  acr_name = "acrdev2025"
  rg_name  = "rg_dev"
  location = "West Europe"
  tags     = local.common_tags
}

module "sql_server" {
  source         = "../../Module/SQL Server"
  server_name    = "sql-server-dev"
  rg_name        = "rg_dev"
  location       = "West Europe"
  tags           = local.common_tags
  admin_login    = "prakash"
  admin_password = "Prakash@12345"
}

module "sql_db" {
  source      = "../../Module/SQL Database"
  sql_db_name = "sqldb_dev"
  server_id   = module.sql_server.sql_server_id

  max_size_gb = 2
  tags        = local.common_tags

}
module "storage_account" {
  source          = "../../Module/Storage"
  sa_account_name = "stgdev2025"
  rg_name         = "rg_dev"
  location        = "West Europe"
  tags            = local.common_tags

}
module "k8s" {

  source     = "../../Module/k8s cluster"
  aks_name   = "aks_dev"
  rg_name    = "rg_dev"
  location   = "West Europe"
  dns_prefix = "aksdev"

  tags = local.common_tags

}
