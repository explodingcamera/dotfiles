#!/bin/zsh

# fnm support (nodejs)
eval "$(fnm env --use-on-cd)"

mkd() {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# env
source ~/.profile
source ~/.secrets

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# ZSH Plugins
plugins=(
  git
  zsh-autosuggestions
)

# make
source $ZSH/oh-my-zsh.sh

# pnpm
export PNPM_HOME="/home/henry/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

PF_ASCII=arch PF_INFO="ascii title kernel uptime pkgs memory shell" _NET_WM_NAME="Hyprland" pfetch
# bun completions
[ -s "/home/henry/.bun/_bun" ] && source "/home/henry/.bun/_bun"

# this is

export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$HOME/.local/bin/aarch64-linux-musl-cross/bin:~/Android/Sdk/tools:$BUN_INSTALL/bin:$CARGO_HOME/bin:$HOME/Scripts:$PATH"
# export PATH="$HOME/.local/bin:~/Android/Sdk/tools:$BUN_INSTALL/bin:$CARGO_HOME/bin:$HOME/Scripts:$PATH"

# aliases
function scr() {
  grim -g "$(slurp)" - | wl-copy
}

alias fuckit="shutdown now"
alias ls="lsd"
alias s="kitty +kitten ssh"
alias ytmp3="yt-dlp --no-playlist --extract-audio --audio-format mp3 $1"
alias ytmp3-playlist="yt-dlp --extract-audio --audio-format mp3 $1"
alias cu="bunx ncu -i"

# alias code="code --ozone-platform=\"wayland\""
