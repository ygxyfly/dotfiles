# rg - line based grep word
# fd - aka fdfind - find directory
# fzf - fizzy finder

export EDITOR='nvim'

# env
export FOLDER=$HOME/github
export PYPATH=$FOLDER/py
export nandsim01=105.128.26.100
export t400IP=192.168.1.131
alias t400="ssh -X bo@$t400IP"
alias ssi="ssh -X bo.f@$nandsim01"

# self defined bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$PYPATH/bin:$PATH
export PATH=$PYPATH/argo_bin:$PATH
export PATH=$PYPATH/argo_test:$PATH

# sep by os.pathsep - ':' on unix, ';' on windows
# default search is always appended
# use sys.path.insert(0, otherpath) to add at run time
export PYTHONPATH=$PYPATH/lib

# my bash functions
. $PYPATH/bin/bashFunc.sh

# support command line editing with vim
set -o vi

# git auto complete
source $PYPATH/config/git-completion.bash

#export PS1="[\u@\h \w]$"
export PS1="\h \w$ "

# history
HISTSIZE=5000
HISTFILESIZE=10000
export HISTCONTROL=ignoredups
shopt -s histappend # different session sync
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#stty -ixon # ^s suspend terminal instead of foward search history, disable it
# previous line caused "stty: standard input: inappriate ioctl for device"
# following is the remedy to check if it is indeed interactive shell
if [[ $- == *i* ]]; then
  stty -ixon
fi

# theano cannot find dynamic blas
# sudo apt-get install libopenblas-dev, pls check theano website
#export THEANO_FLAGS=blas.ldflags="-L/usr/lib/ -lblas"

# linux alias
alias vi='vim'
alias sc="source ${HOME}/.bashrc"
alias ls='ls --color=auto'
alias ll='ls -ltr --color=auto'
alias la='ls -ltra --color=auto'
alias grep='grep --color=auto'
alias hn="hostname"
alias c="clear"
alias k="clear"

# git alias
alias gc="git commit -a"
alias gm="git commit -m"
alias glog="git log"
alias gls="git ls-files"
alias gd="git pull origin develop"

# screeen use ":layout save default" to save layout in screen
alias sls="screen -ls"
alias sr="screen -r"
alias sdr="screen -dr"

# docker
alias di="docker images | tac | grep bftest"


alias pmd="$HOME/pmd-bin-6.19.0/bin/run.sh pmd"


eval "$(zoxide init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'


# for dotfile
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
