.PHONY: init plan apply destroy
BIRD_ENV=github-creds
init:
	terraform init
	terraform workspace select -or-create ${BIRD_ENV}

plan: init
	terraform plan -var-file=${BIRD_ENV}.tfvars

apply: init
	terraform apply -var-file=${BIRD_ENV}.tfvars -auto-approve

destroy: init
	terraform destroy -var-file=${BIRD_ENV}.tfvars -auto-approve