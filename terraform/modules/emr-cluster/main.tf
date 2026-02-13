resource "aws_emr_cluster" "cluster" {
  name          = var.cluster_name
  release_label = var.emr_version
  applications  = var.applications

  unhealthy_node_replacement        = var.unhealthy_node_replacement
  termination_protection            = var.termination_protection
  keep_job_flow_alive_when_no_steps = var.keep_job_flow_alive_when_no_steps

  auto_termination_policy {
    idle_timeout = var.auto_termination_timeout
  }

  ec2_attributes {
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = var.master_security_group_id
    emr_managed_slave_security_group  = var.slave_security_group_id
    instance_profile                  = var.instance_profile_arn
    key_name                          = var.key_name
  }

  master_instance_group {
    name           = var.master_instance_group_name
    instance_type  = var.master_instance_type
    instance_count = 1
  }

  core_instance_group {
    name           = var.core_instance_group_name
    instance_type  = var.core_instance_type
    instance_count = var.core_instance_count
  }

  service_role = var.service_role_arn

  log_uri = "s3://aws-logs-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.id}/elasticmapreduce/"

  dynamic "bootstrap_action" {
    for_each = var.bootstrap_action_path != "" ? [1] : []
    content {
      path = var.bootstrap_action_path
      name = var.bootstrap_action_name
      args = var.bootstrap_action_args
    }
  }

  configurations_json = var.configurations_json != "" ? var.configurations_json : null

  tags = merge(
    {
      Name = var.cluster_name
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = false
    ignore_changes = [
      # Ignore changes to step configuration if steps are added outside Terraform
      step,
    ]
  }
}

resource "aws_emr_instance_group" "task" {
  count = var.task_instance_count > 0 ? 1 : 0

  cluster_id     = aws_emr_cluster.cluster.id
  instance_type  = var.task_instance_type
  instance_count = var.task_instance_count
  name           = var.task_instance_group_name
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
