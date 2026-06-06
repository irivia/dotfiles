#!/usr/bin/env bash

selected=$(find "$PROJECTS_PATH/" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | fzf --bind 'enter:accept-or-print-query')

if [[ -n "$selected" ]]; then
    if [[ ! -d "$PROJECTS_PATH/$selected" ]]; then
        mkdir -p "$PROJECTS_PATH/$selected"
    fi
    tmux new -ADs "$selected" -c "$PROJECTS_PATH/$selected"
fi
