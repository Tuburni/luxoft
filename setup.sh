#!/bin/bash

# ------------------------------------------------------------------------------------------------
#   This script will setup Grafana in docker container on AWS VM
#   To run this scirpt write in terminal "bash setup.sh"
# ------------------------------------------------------------------------------------------------

echo ---------------------------------------------------------------------------------------------
echo    This script will setup Grafana in docker container on AWS VM
echo ---------------------------------------------------------------------------------------------

cd ~/KondrashovB/luxoft/

# ------------------------------------------------------------------------------------------------
#   The terraform init command initializes a working directory containing Terraform
#   configuration files
terraform init
# ------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------------
#   The terraform plan command creates an execution plan, 
#   which lets you preview the changes that Terraform plans to make to your infrastructure
terraform plan
# ------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------------
#   The terraform apply command executes the actions proposed in a Terraform plan. 
terraform apply -auto-approve
# ------------------------------------------------------------------------------------------------

echo ---------------------------------------------------------------------------------------------
echo    !Noticed that server need some time to setup, please, just wait :D!
echo ---------------------------------------------------------------------------------------------
