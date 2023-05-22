<p align="right"><a href="https://aws.amazon.com" rel="nofollow"><img src="https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" data-canonical-src="https://img.shields.io/badge/Amazon_AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" style="max-width: 100%;"></a> </p>

# <p align="center"> Task for devops intern </p>

## Task: Terraform.


### Task decomposition ( from [Luxoft](https://career.luxoft.com/ua/)):
- Create a _Terraform_ module for provisioning one _AWS_/_Azure_/_GCP_/_OCI_/... (cloud provider of your choice) compute instance (VM);
- Provision one SSH public key for the created instance;
- Provision and attach static IP to the instance;
- Install and configure docker on the instance;
- Run _Grafana_ container in _Docker_ so that it is accessible from the web, i.e. `http://<IP-ADDRESS>:<PORT>/dashboards`;
- Provide instructions along with the code on _GitHub_ (or other VCS platform of your choice).

### Additional:

- Make use of varibales;
- Make use of outputs.

## Optional:

- [X] Make use of _Ansible_ playbooks for configuration management;
- [X] Add custom _Grafana_ dashboards to observe specific metrics.

##
    
### To get started, you'll need ( complete by [Borys Kondrashov](https://github.com/Tuburni)):

1. [Register on AWS](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html)
2. Create and copy credentials, like:
  region     = "eu-central-1"  # Replace with your desired AWS region
  access_key = "put here your access key"
  secret_key = "put here your secret code"
3. Install Terraform
4. Install Ansible 

1. Install GIT and clone this repository:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
cd
mkdir KondrashovB
cd KondrashovB
sudo apt-get update -y
sudo apt install git -y
git --version
sudo apt-get update -y
git clone https://github.com/Tuburni/luxoft
cd ~/luxoft/
```

2. Enter your AWS credentials in variables.tf:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
nano ~/globalLogic_Homework_KondrashovBorys/task3_IntorductionToAWS/modules/variable.tf
```

3. Run bash script `install.sh` to install terraform:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
bash install.sh
```
4. Run bash script `setup.sh` to setup Moodle on AWS:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
bash setup.sh
```


### Useful links:
1. [Creating an AWS account](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html)
2. [Create EC2 instance](https://www.guru99.com/creating-amazon-ec2-instance.html)
