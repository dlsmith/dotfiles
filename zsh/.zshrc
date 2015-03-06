# Path to oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load from ~/.oh-my-zsh/themes/.
ZSH_THEME='mh'

# Space-separated list of plugins to load.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Personal settings.
export EDITOR='vim'

PATH=$PATH:$HOME/.rvm/bin
PATH=/usr/local/bin:$PATH

# Fix colors in tmux.
alias tmux="TERM=screen-256color-bce tmux"

# Tmux shortcuts.
alias tmns="tmux new -s"
alias tmls="tmux list-sessions"
alias tmd="tmux detach"
alias tma="tmux attach -t"
alias tms="tmux switch -t"
