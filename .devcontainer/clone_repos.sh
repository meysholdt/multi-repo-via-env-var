#!/bin/bash
# Clones repos from MY_ADDITIONAL_REPOS (semicolon-separated) into /workspaces
IFS=';' read -ra REPOS <<< "$MY_ADDITIONAL_REPOS"
for repo in "${REPOS[@]}"; do
    [ -z "$repo" ] && continue
    name=$(basename "$repo" .git)
    [ -d "/workspaces/$name" ] || git clone "$repo" "/workspaces/$name"
done
