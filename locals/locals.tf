locals { #define local variables that can be used within the Terraform configuration. These are calculated based on other variables/values defined in the configuration.
  final_name = "${var.project}-${var.environment}-${var.component}"
  ec2_tags = merge(
    var.common_tags,
    {
        environment = "dev",
        version = "1.0"
    }
  )
}