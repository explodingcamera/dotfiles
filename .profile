# xdg path fixes
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export TS3_CONFIG_DIR=$XDG_CONFIG_HOME/ts3client
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export BUN_INSTALL=$XDG_DATA_HOME/bun
export PNPM_HOME=$XDG_DATA_HOME/pnpm
export GOPATH=$XDG_DATA_HOME/go
export GO_BIN=$GOPATH/bin
export GOMODCACHE=$XDG_CACHE_HOME/go/mod
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export CARGO_HOME=$XDG_DATA_HOME/cargo
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export HISTFILE="$XDG_STATE_HOME"/bash/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export W3M_DIR="$XDG_STATE_HOME/w3m" 
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java 
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle 

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_TOOLS=$HOME/Android/Sdk/tools

export BROWSER=firefox-developer-edition
export EDITOR=code

export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_THEME="robbyrussell"

export PATH="$GO_BIN:$PNPM_HOME:$ANDROID_SDK_TOOLS:$HOME/.local/bin:$BUN_INSTALL/bin:$CARGO_HOME/bin:$HOME/Scripts:$PATH"
