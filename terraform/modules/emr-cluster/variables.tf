variable "cluster_name" {
  description = "Name of the EMR cluster"
  type        = string
}

variable "emr_version" {
  description = "EMR release version (e.g., emr-6.15.0)"
  type        = string
}

variable "applications" {
  description = "List of applications to install on the cluster"
  type        = list(string)
  default     = ["Spark", "Hadoop"]
}

variable "subnet_id" {
  description = "Subnet ID where the cluster will be launched"
  type        = string
}

variable "master_security_group_id" {
  description = "Security group ID for master node"
  type        = string
}

variable "slave_security_group_id" {
  description = "Security group ID for core and task nodes"
  type        = string
}

variable "instance_profile_arn" {
  description = "IAM instance profile ARN for EC2 instances"
  type        = string
}

variable "service_role_arn" {
  description = "IAM service role ARN for EMR"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "master_instance_type" {
  description = "Instance type for master node"
  type        = string
  default     = "m5.xlarge"
}

variable "master_instance_group_name" {
  description = "Name for master instance group"
  type        = string
  default     = "master-group"
}

variable "core_instance_type" {
  description = "Instance type for core nodes"
  type        = string
  default     = "m5.xlarge"
}

variable "core_instance_count" {
  description = "Number of core instances"
  type        = number
  default     = 2
}

variable "core_instance_group_name" {
  description = "Name for core instance group"
  type        = string
  default     = "core-group"
}

variable "task_instance_type" {
  description = "Instance type for task nodes"
  type        = string
  default     = "m5.xlarge"
}

variable "task_instance_count" {
  description = "Number of task instances (set to 0 to disable)"
  type        = number
  default     = 0
}

variable "task_instance_group_name" {
  description = "Name for task instance group"
  type        = string
  default     = "task-group"
}

variable "bootstrap_action_path" {
  description = "S3 path to bootstrap action script (leave empty to skip)"
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

variable "configurations_json" {
  description = "JSON string for EMR software configurations"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags for the cluster"
  type        = map(string)
  default     = {}
}

variable "unhealthy_node_replacement" {
  description = "Enable unhealthy node replacement"
  type        = bool
  default     = true
}

variable "termination_protection" {
  description = "Enable termination protection"
  type        = bool
  default     = false
}

variable "keep_job_flow_alive_when_no_steps" {
  description = "Keep cluster alive when no steps are running"
  type        = bool
  default     = true
}

variable "auto_termination_timeout" {
  description = "Auto-termination timeout in seconds"
  type        = number
  default     = 21600 # 6 hours
}
