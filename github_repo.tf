resource "github_repository" "birdwatching_automation" {
  name        = var.name
  description = "Repository for automation setup"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch" "bootstrap" {
  repository = github_repository.birdwatching_automation.name
  branch     = "bootstrap-config"
}

resource "github_branch_protection" "main_protection" {
  repository_id = github_repository.birdwatching_automation.node_id
  pattern       = "main"

  require_conversation_resolution = true

  required_pull_request_reviews {
    required_approving_review_count = 2
  }

  restrict_pushes {
    push_allowances = []
  }

  allows_force_pushes = false
  allows_deletions    = false
}
