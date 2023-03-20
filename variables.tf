variable "environment" {
  description = "Environment name"
  type        = string
}

variable "stack" {
  description = "Stack name"
  type        = string
  validation {
    condition     = var.stack == "" || can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.stack))
    error_message = "Invalid variable: ${var.stack}. Variable name must start with a lowercase letter, end with an alphanumeric lowercase character, and contain only lowercase letters, digits, or a dash (-)."
  }
}

variable "resource_group_name" {
  description = "Resource Group the resources will belong to"
  type        = string
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "application_type" {
  type    = string
  default = "web"

  validation {
    condition     = var.application_type == "web" || var.application_type == "other"
    error_message = "The application type must be either 'web' or 'other'."
  } ### Not correct need to extend to ios,java,MobileCenter,Node.JS,store
}

variable "retention_in_days" {
  description = "Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90."
  type        = number
  default     = 90

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "The retention in days must be between 30 and 730."
  }
} ### Not correct needs to be 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90

variable "sampling_percentage" {
  description = "Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. Defaults to 100."
  type        = number
  default     = 100

  validation {
    condition     = var.sampling_percentage >= 0 && var.sampling_percentage <= 100
    error_message = "The sampling percentage must be between 0 and 100."
  }
}

variable "custom_locations" {
  type = list(object({
    location_name     = string
    retention_in_days = number
  }))
  default = []

  validation {
    condition     = length(var.custom_locations) <= 5
    error_message = "The number of custom locations must be 5 or less."
  }
}

variable "workspace_id" {
  description = "Specifies the id of a log analytics workspace resource. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "local_authentication_disabled" {
  description = " Disable Non-Azure AD based Auth. Defaults to true."
  type        = bool
  default     = true

}
variable "internet_ingestion_enabled" {
  description = " Should the Application Insights component support ingestion over the Public Internet? Defaults to true."
  type        = bool
  default     = true
}
variable "internet_query_enabled" {
  description = " Should the Application Insights component support querying over the Public Internet? Defaults to true."
  type        = bool
  default     = true
}
variable "force_customer_storage_for_profiler" {
  description = " Should the Application Insights component force users to create their own storage account for profiling? Defaults to false."
  type        = bool
  default     = false
}

variable "disable_ip_masking" {
  description = " By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false."
  type        = bool
  default     = false
}

variable "daily_data_cap_in_gb" {
  description = " Specifies the Application Insights component daily data volume cap in GB."
  type        = number
  default     = null
}
variable "daily_data_cap_notifications_disabled" {
  description = " Specifies if a notification email will be send when the daily data volume cap is met."
  type        = bool
  default     = false
}
