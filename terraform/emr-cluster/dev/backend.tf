terraform {
  backend "s3" {
    bucket         = "daljyotg-terraform-state"
    key            = "emr-cluster/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
