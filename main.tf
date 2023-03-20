resource "azurerm_application_insights" "this" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type


  retention_in_days                     = var.retention_in_days
  sampling_percentage                   = var.sampling_percentage
  workspace_id                          = var.workspace_id
  local_authentication_disabled         = var.local_authentication_disabled
  internet_ingestion_enabled            = var.internet_ingestion_enabled
  internet_query_enabled                = var.internet_query_enabled
  force_customer_storage_for_profiler   = var.force_customer_storage_for_profiler
  disable_ip_masking                    = var.disable_ip_masking
  daily_data_cap_in_gb                  = var.daily_data_cap_in_gb
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  tags                                  = merge(var.default_tags, var.extra_tags)

}