# Secrets Manager
data "aws_secretsmanager_secret" "config" {
  name = "terraform/emr-cluster/${local.environment}/variables"
}

data "aws_secretsmanager_secret_version" "config" {
  secret_id = data.aws_secretsmanager_secret.config.id
}

