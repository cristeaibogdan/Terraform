# Terraform

## Installation
1. Install Terraform & verify installation:
```bash
  terraform -version
```

2. Install AWS CLI & verify installation:
```bash
  aws --version
```

## AWS Configuration
Terraform doesn't store credentials. It reads them from the `AWS CLI configuration` on the local machine. 
The repo itself never "has access" to AWS.

1. In the AWS Console go to `IAM → Users → Create user`. Do not use the root account.
   - Attach a policy `AdministratorAccess` so you have access to every service

2. Create an access key. Choose `Command Line Interface (CLI)`.
   - Download the .csv file with the keys

3. Configure
```bash
  aws configure
```
   - AWS Access Key ID: from the .csv file
   - AWS Secret Access Key: from the .csv file
   - Default region: `eu-west-1`
   - Default output format: `json`

4. Verify
```bash
  aws sts get-caller-identity
```
It should return your account ID and the IAM user ARN.

## Usage
1. Open a terminal cmd line in one of the respective folders
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`
5. [Optional] Run `terraform destroy` to remove all resources created in AWS
