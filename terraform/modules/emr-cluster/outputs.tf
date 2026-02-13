output "cluster_id" {
  description = "EMR cluster ID"
  value       = aws_emr_cluster.cluster.id
}

output "cluster_name" {
  description = "EMR cluster name"
  value       = aws_emr_cluster.cluster.name
}

output "cluster_arn" {
  description = "EMR cluster ARN"
  value       = aws_emr_cluster.cluster.arn
}

output "master_public_dns" {
  description = "Master node public DNS"
  value       = aws_emr_cluster.cluster.master_public_dns
}

output "task_instance_group_id" {
  description = "Task instance group ID (if created)"
  value       = var.task_instance_count > 0 ? aws_emr_instance_group.task[0].id : null
}
