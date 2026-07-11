variable "function_name" {
  type        = string 
  description = "Name of your lambda function"
}

variable "role" {
  type        = string
  description = "Lambda execution role ARN string"
}

variable "layers" {
  type        = list(string)
  description = "A list of Lambda Layer ARNs to attach to the function"
}

variable "zip_file_path" {
  type        = string
  description = "The relative local file path to your lambda deployment zip package"
}

variable "skip_destroy" {
  type        = bool
  description = "Set to true to retain the old function version binary on destroy"
}

variable "handler" {
  type        = string
  description = "The function entrypoint method configuration name string"
}

variable "runtime" {
  type        = string
  description = "The underlying language code platform execution runtime engine (e.g. nodejs18.x)"
}

variable "timeout" {
  type        = number
  description = "The maximum execution allocation compute duration time limit in seconds"
}

variable "memory_size" {
  type        = number
  description = "Memory size resource execution allocation layout limit footprint in megabytes"
}

# --- Lambda Function URL Resource Attributes ---
variable "authorization_type" {
  type        = string
  description = "The authentication type paradigm filter parameter layer (e.g. AWS_IAM or NONE)"
}

variable "invoke_mode" {
  type        = string
  description = "The payload streaming delivery configuration layout paradigm type (e.g. BUFFERED)"
}

variable "environment" {
  type        = string
  description = "The deployment runtime targeting profile tracks boundary label (dev or prod)"
}