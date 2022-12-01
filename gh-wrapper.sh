#!/bin/bash

set -euo pipefail

GITHUB_USER="$GH_USER"
GITHUB_TOKEN="$GH_TOKEN"

function check_github_repository() {
  curl \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -s "https://api.github.com/repos/${GITHUB_USER}/${1}" | jq -r \
    'if .message == "Not Found" then "404" elif .message == "Bad credentials" then "401" else "200" end'
}

function git_clone() {
  REPOSITORY="$1"
  CLONE_URL="https://github.com/${GITHUB_USER}/${REPOSITORY}.git"
  AUTH_CLONE_URL=$(echo "$CLONE_URL" | sed -E 's/https:\/\//https:\/\/'"$GITHUB_TOKEN"'@/')
  if [ "$(check_github_repository "$@")" == "404" ] || [ "$(check_github_repository "$@")" == "401" ]; then
    printf "Repository Not Found!"
  elif [ "$(check_github_repository "$@")" == "200" ]; then
    printf "Cloning into '%s'..." "$REPOSITORY"
    git clone "$AUTH_CLONE_URL" -q
  fi
}

git_clone "$@"
