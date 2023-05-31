#Create a budget for S3 with a limit of 50 GB of storage.

resource "aws_budgets_budget" "s3" {
  name         = "budget-s3-usage-gb"
  budget_type  = "USAGE"
  limit_amount = "50"
  limit_unit   = "GB"
  time_period_end   = "2030-12-31_00:00"
  time_period_start = "2022-01-01_00:00"
  time_unit    = "MONTHLY"
}