# ~/.zshrc — ShamelesAbyss mobile dev shell

# History
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Colors
export TERM="${TERM:-xterm-256color}"
export CLICOLOR=1
export COLORTERM=truecolor

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

export LS_COLORS="${LS_COLORS}:di=1;36:ln=1;35:so=1;32:pi=33:ex=1;32:bd=33;01:cd=33;01:su=37;41:sg=30;43:tw=30;42:ow=34;42"

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

autoload -Uz colors && colors
autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%b)'

PROMPT='%F{45}%n@%m%f:%F{118}%~%f%F{213}${vcs_info_msg_0_}%f %# '

# Abyss launcher
abyss_run() {
  clear

  if [ -x "$HOME/.config/shamelesabyss/banner.sh" ]; then
    "$HOME/.config/shamelesabyss/banner.sh"
  fi

  echo

  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
  fi
}

alias abyss="abyss_run"

# Auto-run on interactive shell startup
abyss_run
