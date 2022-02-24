  
module "aws_backup_example" {

  source = "../modules/awsbackup/"

  # Vault
  vaultname = "example_backup_vault"

  # plan
  planname = "tf_example_backup_plan"

  #One rule
  rule_name              = "rule-1"
  rule_schedule          = var.rule_schedule
  rule_start_window      = var.rule_start_window
  rule_completion_window = var.rule_completion_window
  rule_enable_continuous_backup = false
}
