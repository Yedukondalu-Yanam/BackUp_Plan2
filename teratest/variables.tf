
# AWS Backup vault
variable "vault_name" {
  description = "Name of the backup vault to create. If not given, AWS use default"
  type        = string
  default     = "tf_example_backup_vault"
}


# AWS Backup plan
variable "plan_name" {
  description = "The display name of a backup plan"
  type        = string
  default     = "tf_example_backup_plan"
}

# Default rule
variable "rule_name" {
  description = "An display name for a backup rule"
  type        = string
  default     = null
}

variable "rule_schedule" {
  description = "A CRON expression specifying when AWS Backup initiates a backup job"
  type        = string
  default     = "cron(42 7 * * ? *)"
}

variable "rule_start_window" {
  description = "The amount of time in minutes before beginning a backup"
  type        = number
  default     = 60
}

variable "rule_completion_window" {
  description = "The amount of time AWS Backup attempts a backup before canceling the job and returning an error"
  type        = number
  default     = 120
}

# Selection
#variable "selection_name_s3" {
  #description = "The display name of a resource selection document"
  #type        = string
  #default = "tf_example_backup_selection_s3"
#}

#variable "selection_name_ec2" {
  #description = "The display name of a resource selection document"
  #type        = string
  #default = "tf_example_backup_selection_ec2"
#}
