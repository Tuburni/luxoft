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

### Optional:

- [X] Make use of _Ansible_ playbooks for configuration management;
- [X] Add custom _Grafana_ dashboards to observe specific metrics.

##
    
### To get started, you'll need ( complete by [Borys Kondrashov](https://github.com/Tuburni)):

1. [Register on AWS](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html).

2. Install GIT and clone this repository:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
cd
mkdir KondrashovB
cd KondrashovB
sudo apt-get update -y
sudo apt-get install git -y
git --version
sudo apt-get update -y
git clone https://github.com/Tuburni/luxoft
cd ~/KondrashovB/luxoft/
```
3. [Create and copy access key and secret key in AWS](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html).

4. Enter your AWS access key and AWS secret key in variables.tf:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
nano ~/KondrashovB/luxoft/variable.tf
```

5. Run bash script `install.sh` to install Terraform and Ansible:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
bash install.sh
```

6. Run bash script `setup.sh` to setup Grafana in Docker on AWS:
>  <sub> _copy and past this comand to terminal_ </sub>
```bash
bash setup.sh
```


### Useful links:
1. [Creating an AWS account](https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-creating.html)
2. [Create EC2 instance](https://www.guru99.com/creating-amazon-ec2-instance.html)
3. [Createaccess key and secret key in AWS](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html).

