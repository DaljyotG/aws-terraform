output "cluster_id" {
  description = "EMR cluster ID"
  value       = module.emr_cluster.cluster_id
}

output "cluster_name" {
  description = "EMR cluster name"
  value       = module.emr_cluster.cluster_name
}

output "cluster_arn" {
  description = "EMR cluster ARN"
  value       = module.emr_cluster.cluster_arn
}

output "master_public_dns" {
  description = "Master node public DNS"
  value       = module.emr_cluster.master_public_dns
}

output "task_instance_group_id" {
  description = "Task instance group ID"
  value       = module.emr_cluster.task_instance_group_id
}
