# ~/.bashrc — ShamelesAbyss mobile dev shell

# Only run interactively
case $- in
  *i*) ;;
  *) return ;;
esac

# History
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
shopt -s checkwinsize

# Colors
export TERM="${TERM:-xterm-256color}"
export CLICOLOR=1
export COLORTERM=truecolor

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

# Vivid ls colors
export LS_COLORS="${LS_COLORS}:di=1;36:ln=1;35:so=1;32:pi=33:ex=1;32:bd=33;01:cd=33;01:su=37;41:sg=30;43:tw=30;42:ow=34;42"

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Prompt colors
parse_git_branch() {
  git branch 2>/dev/null | sed -n 's/^\* / (/p' | sed 's/$/)/'
}

PS1='\[\e[38;5;45m\]\u@\h\[\e[0m\]:\[\e[38;5;118m\]\w\[\e[38;5;213m\]$(parse_git_branch)\[\e[0m\]\$ '

# Abyss banner
alias abyss="$HOME/.config/shamelesabyss/banner.sh"

if [ -x "$HOME/.config/shamelesabyss/banner.sh" ]; then
  "$HOME/.config/shamelesabyss/banner.sh"
fi
