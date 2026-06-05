# History Configuration
HISTTIMEFORMAT="[%F %T] "
HISTFILE=~/.bash_eternal_history
HISTCONTROL=ignoredups
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

#Options
bind "TAB:menu-complete"
bind "C-H:shell-backward-kill-word"
bind "set completion-ignore-case on"
bind "set enable-bracketed-paste off"
bind -x '"\C-a":"~/.config/scripts/open_repos.sh"'
bind -x '"\C-t":"~/.config/scripts/open_repos.sh"'
bind -x '"\C-e":"~/.config/scripts/open_session.sh"'

# Variables
export EDITOR=nvim
export GTK_USE_PORTAL=1 
export MANPAGER='nvim +Man!'
# PS1="[$SHLVL $USER@$HOSTNAME \\w]$\033[37m "

# Aliases
alias cls="clear"
alias py="python"
alias vim="/usr/bin/nvim"
alias vi="/usr/bin/vim"
alias lg="lazygit"
alias lh="ls -AX"
alias ff="clear && fastfetch"
alias home="cd '$HOME'"
alias desk="cd '$HOME/Desktop'"
alias down="cd '$HOME/Downloads'"
alias f="fg"
alias cd="z"
alias newc="~/.config/scripts/new_c_project.py"

# Functions
function mkcd {
    mkdir -p "$1" && cd "$1"
}

function kanata_rel {
    systemctl --user restart kanata.service
}

function prog {
    cd "$HOME/programming/$1"
}

function proj {
    local selected
    selected=$(find "$HOME/programming/" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | fzf --bind 'enter:accept-or-print-query')
    \cd "$HOME/programming/$selected"
}

function dot {
    cd "$HOME/dotfiles/$1"
}

# pnpm
export PNPM_HOME="/home/pc/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Source
source /etc/profile.d/emscripten.sh

# Evals
eval "$(zoxide init bash)"
eval "$(ssh-agent -s)"

# Clear (duh)
clear
