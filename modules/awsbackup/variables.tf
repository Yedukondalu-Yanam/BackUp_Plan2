# PER ENVIROMENT VARIABLES
variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = ""
}

variable "aws_creds_file" {
  description = "Path to aws cli credentials file"
   default     = ""
}

variable "vaultname" {
  description = "Name of the backup vault to create. If not given, AWS use default"
  type        = string 
}

variable "planname" {
  description = "The display name of a backup plan"
  type        = string
}

# Default rule
variable "rule_name" {
  description = "An display name for a backup rule"
  type        = string 
}

variable "rule_schedule" {
  description = "A CRON expression specifying when AWS Backup initiates a backup job"
  type        = string
}

variable "rule_start_window" {
  description = "The amount of time in minutes before beginning a backup"
  type        = number
}

variable "rule_completion_window" {
  description = "The amount of time AWS Backup attempts a backup before canceling the job and returning an error"
  type        = number
}

variable "rule_enable_continuous_backup" {
  description = "Enable continuous backups for supported resources."
  type        = bool
}

# Selection
#variable "selection_name_s3" {
  #description = "The display name of a resource selection document"
  #type        = string
#}

#variable "selection_name_ec2" {
  #description = "The display name of a resource selection document"
  #type        = string
#}
