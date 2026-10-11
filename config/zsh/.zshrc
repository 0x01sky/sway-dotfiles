# Shell prompt

PS1='%n@%m %F{blue}%~%f $ '


## Autocompletions

autoload -Uz compinit
compinit

# Displaying the clock in the right prompt

# RPROMPT="[%F{blue}%*%F{reset}]"

# Shell aliases

## nvim
command -v nvim &>/dev/null && alias nv="nvim"

## ls
command -v lsd &>/dev/null && alias ls="lsd"

## cat

if command -v bat &>/dev/null; then
  alias cat="bat";
elif command -v batcat &>/dev/null; then
  alias cat="batcat"
fi

## df
command -v duf &>/dev/null && alias df="duf"

## fastfetch
command -v fastfetch &>/dev/null && alias ff="fastfetch"

## grep
command -v grep &>/dev/null && alias grep="grep --color=auto"


# Evaluation for fzf in zsh for CTRL+R

command -v fzf &>/dev/null && eval "$(fzf --zsh --history-size=1000)"


# Shell Functions

mkcd() { mkdir "$1" && cd "$1" }
refresh() { source ~/.zshrc }

# Default Editor

if command -v nvim &>/dev/null; then
  export VISUAL=nvim
  export EDITOR=vim
fi


# PATHS to export

PATH="$HOME/.local/bin:$PATH"
export PATH

# ZSH Completions

[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]  && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## For other distributions

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
