#!/bin/bash

set -e

echo "=== Local Cloud Deployment ==="

cd "$(dirname "$0")/../terraform/environments/local"

echo "Initializing Terraform..."
terraform init

echo "Creating Terraform plan..."
terraform plan -out=tfplan

echo "Applying Terraform plan..."
terraform apply tfplan

echo "=== Deployment Complete ==="

terraform output

