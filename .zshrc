#utoload colors; colors; Lines configured by zsh-newuser-install
autoload colors; colors;
export CLICOLOR=1
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt incappendhistory
setopt extendedhistory
setopt autopushd

hg_branch() {
    hg branch 2>/dev/null | awk '/.+/ {print "[hg:"$1"]"}'
}

git_branch() {
    git branch 2>/dev/null | awk '/\*.+/ {print "[git:"$2"]"}'
}

setopt PROMPT_SUBST
precmd() {
    HG="$(hg_branch)"
    GIT="$(git_branch)"
}
PROMPT='%F{green}${HG}${GIT}%F{grey}%n@%m:%~# '
#PROMPT='%{$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_branch)%{$fg[cyan]%}⇒%{$reset_color%} '

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mag/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# colors
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

alias l='ls -lh'
alias la='ls -alh'
alias grep='grep --color=auto'
alias sml='socat readline exec:sml'
alias rkt='racket -i -l readline'
alias history='history 1'
alias q='rlwrap q'
alias yui='java -jar ~/dev/tools/yuicompressor-2.4.8.jar'

#PATH=$PATH:/opt/play-1.2.3
#PATH=$PATH:/opt/play-2.1.1
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export AWS_CREDENTIAL_FILE=~/.aws_credentials
export GOPATH=$HOME/dev/go

PATH=$PATH:$AWS_RDS_HOME/bin:$HOME/.cabal/bin:/usr/local/sbin:$GOPATH/bin

export JAVA_HOME=$(/usr/libexec/java_home)
export SBT_OPTS=-XX:MaxPermSize=256m

export QHOME=/usr/local/share/q

WORKON_HOME=~/.envs

source /usr/local/bin/virtualenvwrapper.sh

fpath=(/usr/local/share/zsh-completions $fpath)

export LC_CTYPE=en_US.utf-8

export EDITOR=vi

export ANDROID_HOME=/usr/local/opt/android-sdk

# OPAM configuration
. /Users/mag/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

source /usr/local/share/zsh/site-functions/_aws

export PDFLIBLICENSEFILE=~/licensekeys.txt

source ~/.secret.sh
