terraform {
  required_providers {
    testing = {
      source  = "hashicorp/testing"
      version = "0.1.0"
    }
  }
}

variable "id" {
  type     = string
  default  = null
  nullable = true # We'll generate an ID if none provided.
}

variable "input" {
  type = string
}

resource "testing_resource" "child_data" {
  id    = var.id
  value = var.input
}

resource "testing_resource" "another_child_data" {
  count = 2
  id    = var.id
  value = var.input
}

output "id" {
  value = testing_resource.data.id
}
