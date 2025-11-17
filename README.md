# Birdwatching Automation

This repository contains Terraform configuration for automating GitHub repository setup for the Birdwatching project. It provisions repositories, applies branch protection rules, and adds basic templates, workflows, and linters.

## Features

- GitHub repository creation via Terraform.
- Branch protection rules:
  - Require 2 approving reviews.
  - Prevent direct pushes to `main`.
  - Disable force-push.
- Automatically adds:
  - Pull request template.
  - Pre-commit configuration.
  - Prettier workflow.
  - Gitleaks workflow.
  - `.gitignore`.

## Usage

### Initialize Terraform

```sh
make init

make plan

make apply
```
