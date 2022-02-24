###############################################################################
provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.aws_creds_file
  profile                 = var.aws_profile
}


resource "aws_backup_global_settings" "example" {
  global_settings = {
    "isCrossAccountBackupEnabled" = "true"
  }
}


resource "aws_backup_vault" "example" {
  name = var.vaultname
}

resource "aws_backup_plan" "example" {
  name = var.planname

  rule {
    rule_name                = var.rule_name
    target_vault_name        = aws_backup_vault.example.name
    schedule                 = var.rule_schedule
    start_window             = var.rule_start_window
    completion_window        = var.rule_completion_window
    enable_continuous_backup = var.rule_enable_continuous_backup
  }
}


resource "aws_backup_selection" "example_s3" {
  iam_role_arn = aws_iam_role.ab_role.arn
  name         = "tf_example_backup_selection_s3"
  plan_id      = aws_backup_plan.example.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Name"
    value = "awsbackup"
  }
}

resource "aws_backup_selection" "example_ec2" {
  iam_role_arn = aws_iam_role.ab_role.arn
  name         = "tf_example_backup_selection_ec2"
  plan_id      = aws_backup_plan.example.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Name"
    value = "VALUE"
  }
}

resource "aws_backup_selection" "example_rds" {
  iam_role_arn = aws_iam_role.ab_role.arn
  name         = "tf_example_backup_selection_rds"
  plan_id      = aws_backup_plan.example.id

  resources = ["arn:aws:rds:us-east-1:ACCOUNTID:cluster:NAME"]
}

resource "aws_backup_selection" "example_vpc" {
  iam_role_arn = aws_iam_role.ab_role.arn
  name         = "tf_example_backup_selection_vpc"
  plan_id      = aws_backup_plan.example.id


selection_tag {
    type  = "STRINGEQUALS"
    key   = "Name"
    value = "VALUE"
  }
}

