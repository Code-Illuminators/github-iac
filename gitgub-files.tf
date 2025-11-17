
resource "github_repository_file" "pr_template" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = ".github/pull_request_template.md"
  content             = file("bootstrap_files/pull_request_template.md")
  commit_message      = "Add PR template"
  overwrite_on_create = true
}

resource "github_repository_file" "gitignore" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = ".gitignore"
  content             = file("bootstrap_files/gitignore")
  commit_message      = "Add gitignore"
  overwrite_on_create = true
}

resource "github_repository_file" "pre_commit_config" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = ".pre-commit-config.yaml"
  content             = file("bootstrap_files/pre-commit-config.yaml")
  commit_message      = "Add pre-commit config"
  overwrite_on_create = true
}

resource "github_repository_file" "prettier_workflow" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = ".github/workflows/prettier.yml"
  content             = file("bootstrap_files/prettier.yml")
  commit_message      = "Add prettier workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "gitleaks_workflow" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = ".github/workflows/gitleaks.yml"
  content             = file("bootstrap_files/gitleaks.yml")
  commit_message      = "Add gitleaks workflow"
  overwrite_on_create = true
}

resource "github_repository_file" "readme" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = "README.md"
  content             = file("bootstrap_files/README.md")
  commit_message      = "Add README"
  overwrite_on_create = true
}

resource "github_repository_file" "gitleaks_toml" {
  repository          = github_repository.birdwatching_automation.name
  branch              = github_branch.bootstrap.branch
  file                = ".gitleaks.toml"
  content             = file("bootstrap_files/gitleaks.toml")
  commit_message      = "Gitleaks custom file"
  overwrite_on_create = true
}

resource "github_repository_pull_request" "bootstrap_pr" {
  base_repository = github_repository.birdwatching_automation.name
  base_ref        = "main"
  head_ref        = github_branch.bootstrap.branch
  title           = "Bootstrap repository configuration"
  body            = "Initial setup: workflows, linters, templates"
  depends_on = [github_repository_file.readme]
}
