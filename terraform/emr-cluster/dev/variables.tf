# Cluster Configuration
variable "cluster_name" {
  description = "Name of the EMR cluster"
  type        = string
}

variable "emr_version" {
  description = "EMR release version (e.g., emr-7.10.0)"
  type        = string
}

variable "applications" {
  description = "List of applications to install on the cluster"
  type        = list(string)
}

# Instance Configuration (frequently changed)
variable "master_instance_type" {
  description = "Instance type for master node"
  type        = string
}

variable "core_instance_type" {
  description = "Instance type for core nodes"
  type        = string
}

variable "core_instance_count" {
  description = "Number of core instances"
  type        = number
}

variable "task_instance_type" {
  description = "Instance type for task nodes"
  type        = string
}

variable "task_instance_count" {
  description = "Number of task instances"
  type        = number
}

# Key Pair
variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = ""
}

# Bootstrap Action 
variable "bootstrap_script_name" {
  description = "Bootstrap script filename (e.g., configure-emr.sh) or empty string to disable"
  type        = string
  default     = ""
}

variable "bootstrap_action_name" {
  description = "Name for the bootstrap action"
  type        = string
  default     = "Custom Bootstrap"
}

variable "bootstrap_action_args" {
  description = "Arguments for bootstrap action"
  type        = list(string)
  default     = []
}

# Software Configuration
variable "configurations_json" {
  description = "JSON string for EMR software configurations"
  type        = string
  default     = ""
}