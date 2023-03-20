# Terraform Azure Application Insights Module

This Terraform module creates an Azure Application Insights resource in a specified resource group.

The module provides the following features:

- Customizable resource name
- Customizable resource location
- Customizable resource tags
- Customizable retention in days
- Customizable sampling percentage
- Customizable correlation settings
- Customizable feature flags
- Customizable HTTP monitoring settings
- Customizable custom locations
- Customizable properties

## Usage

To use this module, include the following code in your Terraform configuration:

```hcl
module "app_insights" {
  source = "path/to/this/module"

  name                = "example-app-insights"
  location            = "eastus"
  resource_group_name = "example-rg"

  # Optional Parameters
  application_type = "web"
  retention_in_days = 30
  sampling_percentage = 50
  tags = {
    Environment = "Dev"
  }
  custom_locations = []
  workspace_id = ""
  correlation = {
    client_track_enabled = true
  }
  feature_flags = {
    disable_snapshots = true
    disable_ip_masking = false
  }
  http_monitoring = {
    enable_http_correlation_headers = true
    enable_response_headers = true
  }
  properties = {}
}
