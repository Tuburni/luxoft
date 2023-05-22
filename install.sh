#!/bin/bash

# ------------------------------------------------------------------------------------------------
#   This script will install Terraform and Ansible to this machine
#   To run this scirpt write in terminal "bash install.sh"
# ------------------------------------------------------------------------------------------------

echo ---------------------------------------------------------------------------------------------
echo    This script will install Terraform and Ansible to this machine
echo ---------------------------------------------------------------------------------------------


sudo apt-get update -y
wget https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_amd64.zip
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install ansible -y
sudo apt install zip -y
sudo unzip terraform_1.2.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version
ansible --version

echo ---------------------------------------------------------------------------------------------
echo    Congradulation, Terraform and Ansible was sucesfully instaled
echo ---------------------------------------------------------------------------------------------
