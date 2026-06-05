#!/usr/bin/env bash

PROJECTS="$HOME/programming/repos/"

selected=$(find "$PROJECTS" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | fzf --bind 'enter:accept-or-print-query')

if [[ -n "$selected" ]]; then
    if [[ ! -d "$PROJECTS/$selected" ]]; then
        mkdir -p "$PROJECTS/$selected"
    fi
    tmux new -ADs "$selected" -c "$PROJECTS/$selected"
fi
