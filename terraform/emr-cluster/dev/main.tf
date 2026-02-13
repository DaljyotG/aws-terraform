module "emr_cluster" {
  source = "../../modules/emr-cluster"

  # Cluster configuration 
  cluster_name = var.cluster_name
  emr_version  = var.emr_version
  applications = var.applications

  # Network -  Secrets Manager 
  subnet_id = local.secrets.subnet_id

  # Security Groups -  Secrets Manager
  master_security_group_id = local.secrets.master_security_group_id
  slave_security_group_id  = local.secrets.slave_security_group_id

  # IAM - Secrets Manager 
  instance_profile_arn = local.secrets.instance_profile_arn
  service_role_arn     = local.secrets.service_role_arn

  # Key Pair - Secrets Manager
  key_name = local.secrets.key_name

  # Instance Configuration
  master_instance_type = var.master_instance_type
  core_instance_type   = var.core_instance_type
  core_instance_count  = var.core_instance_count
  task_instance_type   = var.task_instance_type
  task_instance_count  = var.task_instance_count

  # Bootstrap actions
  # bootstrap_action_path = local.bootstrap_action_path
  # bootstrap_action_name = var.bootstrap_action_name
  # bootstrap_action_args = var.bootstrap_action_args

  # Software Configuration
  configurations_json = var.configurations_json

  # Tags
  tags = local.tags
}
