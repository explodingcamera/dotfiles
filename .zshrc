#!/bin/zsh
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# env
source ~/.profile
source ~/.secrets

# ZSH Plugins
plugins=(
    git
    zsh-autosuggestions
)

# aliases
function scr() {
    grim -g "$(slurp)" - | wl-copy
}

function mkd() {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

alias fuckit="shutdown now"
alias ls="lsd"
alias la="ls -lAh"
alias s="kitty +kitten ssh"
alias ytmp3="yt-dlp --no-playlist --extract-audio --audio-format mp3 $1"
alias ytmp3-playlist="yt-dlp --extract-audio --audio-format mp3 $1"
alias cu="bunx npm-check-updates -i"

eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

. "/usr/local/env"
. "$XDG_DATA_HOME/../bin/env"

PF_ASCII=arch PF_INFO="ascii title kernel uptime pkgs memory shell" _NET_WM_NAME="Hyprland" pfetch

# Use XDG dirs for completion and history files
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
