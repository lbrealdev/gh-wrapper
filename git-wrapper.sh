#!/bin/bash

set -euo pipefail

GITHUB_USER="$GH_USER"
GITHUB_TOKEN="$GH_AUTH_TOKEN"
GITHUB_URL="https://github.com"
GITHUB_API_URL=${GITHUB_URL/https:\/\//https:\/\/api.}

# Check the repository in github and 
function github_check_repository() {
  HTTP_STATUS=$(curl -sI \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    "${GITHUB_API_URL}/repos/${GITHUB_USER}/${1}" | grep "HTTP" | awk '{print $2}')
}

# Format the git clone url and clone the repository.
function git_clone_repository() {
  CLONE_AUTH_URL=${GITHUB_URL/https:\/\/github.com/https:\/\/"$GITHUB_TOKEN"@github.com/"$GITHUB_USER"/"$REPOSITORY".git}
  git clone -q "$CLONE_AUTH_URL"
}

function main() {
  # Verify the number of command line arguments passed to a script.
  if [ $# -eq 1 ]; then
    REPOSITORY="$1"
    github_check_repository "$REPOSITORY"
    # Use a case statement to handle different HTTP status codes
    case "$HTTP_STATUS" in
      404)
        printf "Repository not found!\n"
        ;;
      401)
        printf "Invalid credentials!\n"
        ;;
      200)
        printf "Cloning into '%s'...\n" "$REPOSITORY"
        git_clone_repository
        ;;
    esac
  else
    printf "Missing argument!\n"
    exit 0
  fi
}

main "$@"
