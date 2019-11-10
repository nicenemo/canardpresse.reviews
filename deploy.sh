#!/bin/bash

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t ananke

# Go To Public folder
cd public

if [ -n "$GITHUB_AUTH_SECRET" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo $GITHUB_AUTH_SECRET > ~/.git-credentials

    git config credential.helper store
    git config user.email "username-blog-bot@users.noreply.github.com"
    git config user.name "username-blog-bot"
fi


# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git commit -m "Rebuild site"
git push --force origin HEAD:master
rm ~/.git-credentials
