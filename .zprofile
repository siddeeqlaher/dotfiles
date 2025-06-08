# XDG Base Directory Specification variables (https://specifications.freedesktop.org/basedir-spec/latest/)
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"
XDG_RUNTIME_DIR="${HOME}/.local/run"
XDG_SCRIPTS_DIR="${HOME}/.local/bin"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG Cleanup
ZSH_COMPDUMP="$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
HISTFILE="$XDG_STATE_HOME/zsh/history"
ZSH_SESSION_FILE="$XDG_STATE_HOME/zsh/$(date +%s).session"
LESSHISTFILE="$XDG_CACHE_HOME/less_history"
