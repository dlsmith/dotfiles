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
PATH=/usr/local/bin:/usr/local/sbin:$PATH:${HOME}/code/scripts

# Fix colors in tmux.
alias tmux="TERM=screen-256color-bce tmux"

# Tmux shortcuts.
alias tmns="tmux new -s"
alias tmls="tmux list-sessions"
alias tmd="tmux detach"
alias tma="tmux attach -t"
alias tms="tmux switch -t"

# Random aliases.
alias idk="vim ${HOME}/source/notes/uncategorized/idk.md"

alias lsl="ls -lh"

alias ipybl="ipython --profile bodylabs"

function gch {
    if [[ $# -eq 0 ]]; then
        base_branch="origin/master" 
    elif [[ $# -eq 1 ]]; then
        base_branch=$1
    else;
        echo "Expected at most one argument"
        return
    fi

    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git diff --name-only "${base_branch}..${current_branch}"
}

# Homebrew nvm.
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

BLZSHRC=$HOME/code/dotfiles/zsh/.bodylabs_zshrc
if [ -e $BLZSHRC ]; then
  source $BLZSHRC
fi
