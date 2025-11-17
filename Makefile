.PHONY: init plan apply destroy
GITHUB_ENV=github-creds
init:
	terraform init
	terraform workspace select -or-create ${GITHUB_ENV}

plan: init
	terraform plan -var-file=${GITHUB_ENV}.tfvars

apply: init
	terraform apply -var-file=${GITHUB_ENV}.tfvars -auto-approve

destroy: init
	terraform destroy -var-file=${GITHUB_ENV}.tfvars -auto-approve