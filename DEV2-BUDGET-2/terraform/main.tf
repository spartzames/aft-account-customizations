#Create a budget for ec2 with a limit of certain monthly usage amount.

resource "aws_budgets_budget" "ec2" {
  name              = "budget-ec2-monthly"
  budget_type       = "COST"
  limit_amount      = "500"
  limit_unit        = "USD"
  time_period_end   = "2030-12-31_00:00"
  time_period_start = "2022-01-01_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["dummy@example.com"]
  }
}

#Create a budget for s3 with a limit of 3 GB of storage.

resource "aws_budgets_budget" "s3" {
  name         = "budget-s3-usage-gb"
  budget_type  = "USAGE"
  limit_amount = "10"
  limit_unit   = "GB"
  time_period_end   = "2030-12-31_00:00"
  time_period_start = "2022-01-01_00:00"
  time_unit    = "MONTHLY"
}