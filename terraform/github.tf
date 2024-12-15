data "github_user" "kirk" {
  username = "kirkeasterson"
}

resource "github_repository" "this" {
  name        = "cv"
  description = "The source code for my CV"

  visibility = "public"
  has_issues = false
  has_discussions = false
  has_projects = false
  has_wiki = false
  is_template = false

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_auto_merge = true
  delete_branch_on_merge = true
  allow_update_branch = true

  allow_squash_merge = true
  squash_merge_commit_title = "PR_TITLE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
}

resource "github_branch" "main" {
  repository = github_repository.this.name
  branch     = "main"
}

resource "github_branch_default" "default"{
  repository = github_repository.this.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.this.node_id
  pattern          = "main"
  enforce_admins   = false
  allows_deletions = false
  lock_branch = true
  required_linear_history = true

  required_status_checks {
    strict   = true
  }

  required_pull_request_reviews {
    require_code_owner_reviews = true
    dismissal_restrictions = [
      data.github_user.kirk.node_id,
    ]
  }
}
