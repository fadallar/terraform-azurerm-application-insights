output "app_insights_id" {
  value       = azurerm_application_insights.this.id
  description = "The ID of the Application Insights resource."
}

output "app_insights_instrumentation_key" {
  value       = azurerm_application_insights.this.instrumentation_key
  description = "The instrumentation key of the Application Insights resource."
  sensitive   = true
}

output "app_insights_app_id" {
  value       = azurerm_application_insights.this.app_id
  description = "The App ID of the Application Insights resource."
}

output "app_insights_connection_strings" {
  value       = azurerm_application_insights.this.connection_string
  description = "The connection strings for the Application Insights resource."
  sensitive   = true
}