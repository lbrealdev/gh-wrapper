#!/bin/bash

set -euo pipefail

# Get the currently authenticated user.
function gh_graphql_owner() {
  GITHUB_OWNER=$(
  gh api graphql -f query='
    query {
      viewer {
        login
      }
    }' | jq -r '.data.viewer.login'
  )
}

# Setup gh cli as a credential helper.
function gh_setup_git() {
  gh auth setup-git
}

# Clone repository.
function gh_clone_repository() {
  REPOSITORY="$1"
  gh_graphql_owner
  gh_setup_git
  gh repo clone "$GITHUB_OWNER"/"$REPOSITORY"
}

gh_clone_repository "$@"
