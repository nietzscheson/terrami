Terrami Project
==============

Reliable way to create and provision an AWS AMI with Packer, Ansible & Terraform (others Nix, Taskfile, AWSCLI)

**Is highly recommended have Nix installed, otherwise you will need manually install: Packer, Ansible, Terraform and Taskfile and AWSCLI**

# Installation

1. First, clone this repository:

```bash
git clone https://github.com/nietzscheson/terrami && cd terrami
```
2. Export the environment vars:
```bash
export AWS_ACCESS_KEY_ID=your-credentials
export AWS_SECRET_ACCESS_KEY=your-credentials
export AWS_DEFAULT_REGION=us-east-2
export AWS_CLI_AUTO_PROMPT=on
export NIXPKGS_ALLOW_UNFREE=1
```
3. Start the Nix-shell:
```bash
nix-shell
```
3. Check all the Taskfile commands:
```bash
task --list
task: Available tasks for this project:
* ansible.check:            Check the Ansible Playbook
* aws.sts:                  Who am I in AWS
* packer.build:             Build the Packer Image
* packer.format:            Format the Packer Template
* packer.validate:          Validate the Packer Template
* terraform.apply:          Apply the Terraform Deployment
* terraform.destroy:        Destroy the Terraform Deployment
* terraform.format:         Format the Terraform Code
* terraform.plan:           Plan the Terraform Deployment
* terraform.validate:       Validate the Terraform Code
```



