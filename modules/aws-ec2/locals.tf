locals {
  resource_tags = {
    resource-type               = var.resource-type
    resource-automation-exclude = var.resource-automation-exclude
    resource-pii                = var.resource-pii
    environment                 = var.environment
  }
}

