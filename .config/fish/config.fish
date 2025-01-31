set -g fish_greeting


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fnm support (nodejs)
fnm env --use-on-cd | source

function mkd
  mkdir -p -- $argv[1]
  and cd -P -- $argv[1]
end

# env
source ~/.profile
source ~/.secrets

# Preferred editor for local and remote sessions
if test -n "$SSH_CONNECTION"
  set -x EDITOR 'nano'
else
  set -x EDITOR 'code'
end

# pnpm
set -x PNPM_HOME "/home/henry/.local/share/pnpm"
set -x PATH $PNPM_HOME $PATH

# Display ASCII info with pfetch
# env PF_ASCII=arch PF_INFO="ascii title kernel uptime pkgs memory shell" pfetch


# bun completions
if test -s "/home/henry/.bun/_bun"
  source "/home/henry/.bun/_bun"
end

# Additional PATH entries
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH "$HOME/.local/bin" "$HOME/.local/bin/aarch64-linux-musl-cross/bin" "$HOME/Android/Sdk/tools" "$BUN_INSTALL/bin" "$CARGO_HOME/bin" "$HOME/Scripts" $PATH

# aliases
function scr
  grim -g (slurp) - | wl-copy
end

alias fuckit="shutdown now"
alias ls="lsd"
alias s="kitty +kitten ssh"
alias ytmp3="yt-dlp --no-playlist --extract-audio --audio-format mp3 $argv[1]"
alias ytmp3-playlist="yt-dlp --extract-audio --audio-format mp3 $argv[1]"
alias cu="bunx ncu -i"
alias gl="glab"

# zoxide initialization for Fish
zoxide init fish | source
