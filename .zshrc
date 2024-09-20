export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="frontcube"

plugins=(tmux git zsh-autosuggestions zsh-syntax-highlighting web-search vi-mode gh brew)

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOQUIT=true
ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=true

bindkey '^@' autosuggest-execute
bindkey '^ ' autosuggest-execute

bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export VI_MODE_SET_CURSOR=true

export EDITOR='cursor'
export VISUAL='cursor'

[ -s "/Users/simonmielecki/.bun/_bun" ] && source "/Users/simonmielecki/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/simonmielecki/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH=$PATH:~/.bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/ewrap
export PATH=$PATH:~/.local/lib/python3.10/site-packages
export PATH=$HOME/.tmuxifier/bin:$PATH
export PATH=$PATH:~/keuze

alias cl='clear'
alias :q='exit'
alias :qa='tmux kill-server'
alias :r='omz reload'
alias :wq='tmux detach'
alias :w='tmux detach'
alias :c='tmux kill-ses -a'
alias :e='tmux kill-ses'
alias cd='z'

source $ZSH/oh-my-zsh.sh

eval "$(tmuxifier init -)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
