# Shell prompt

PS1='%n@%m %F{blue}%~%f $ '

# History Size and History File

export HISTSIZE=1000

# Autocompletions

autoload -Uz compinit 
compinit

## Displaying an ascii art at shell startup

# command -v cowsay fortune >/dev/null 2>&1 && cowsay "$(fortune -n 2)"

# Displaying the clock in the right prompt

# RPROMPT="[%F{blue}%*%F{reset}]"

# Shell aliases

## vim
command -v vim &>/dev/null && alias vi="vim"

## ls
command -v lsd &>/dev/null && alias ls="lsd"

## cat

if command -v bat &>/dev/null; then
  alias cat="bat"; # For RHEL/Arch/Gentoo/etc
elif command -v batcat &>/dev/null; then
  alias cat="batcat" # For Debian/Ubuntu
fi


## df
command -v duf &>/dev/null && alias df="duf"

## fastfetch
command -v fastfetch &>/dev/null && alias ff="fastfetch"

## grep
command -v grep &>/dev/null && alias grep="grep --color=auto"


## env

command -v fzf >/dev/null 2>&1 && alias env="env | fzf"


# Evaluation for fzf in zsh for CTRL+R

command -v fzf &>/dev/null && source <(fzf --zsh)

# Evaluation for zoxide
#
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"


# Adding golang path

command -v go &>/dev/null && export PATH="$HOME/go/bin:$PATH"

# Shell Functions

mkcd() { mkdir "$1" && cd "$1" }
refresh() { source ~/.zshrc }

# Default Editor

if command -v vim &>/dev/null; then
  export VISUAL=vim
  export EDITOR=vim
fi

# PATHS to export

export PATH="$HOME/.local/bin:$PATH"


# ZSH Completions

[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]  && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## For other distributions

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -d /home/linuxbrew/.linuxbrew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# export PATH="$HOME/oslabs/bin:$PATH"
