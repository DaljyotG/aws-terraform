locals {
  # Environment
  environment = "dev"

  # Secrets Manager
  secrets = jsondecode(data.aws_secretsmanager_secret_version.config.secret_string)
  
  # Bootstap action path from Secrets Manager + FileName
  bootstrap_action_path = var.bootstrap_script_name != "" ? "${local.secrets.bootstrap_action_path}/${var.bootstrap_script_name}" : ""

  tags = {
    Environment = local.environment
    ManagedBy   = "Terraform"
    Stack       = "emr-cluster"
    Project     = "data-processing"
    Owner       = "data-team"
    auto-delete = "false"
  }
}
