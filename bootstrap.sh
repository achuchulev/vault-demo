#!/bin/bash

_terraform=$(which terraform)

# Create network
cd network/
$_terraform init -reconfigure
$_terraform plan -out /tmp/plan.out -detailed-exitcode
$_terraform apply -out /tmp/plan.out

# Install Vault
cd ../vault/
$_terraform init -reconfigure
$_terraform plan -out /tmp/plan.out -detailed-exitcode
$_terraform apply -out /tmp/plan.out

# Sleep 1 minute
sleep 60

# Configure Vault
cd ../vault_config/
$_terraform init -reconfigure
$_terraform plan -out /tmp/plan.out -detailed-exitcode
$_terraform apply -out /tmp/plan.out

# Configure DB
cd ../app/
$_terraform init -reconfigure
$_terraform plan -out /tmp/plan.out -detailed-exitcode
$_terraform apply -out /tmp/plan.out
