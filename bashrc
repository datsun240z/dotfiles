# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

######################################################
####        ALWAYS, not just tab or xterm         ####
######################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# https://old.reddit.com/r/vim/comments/morzue/vim_has_a_native_plugin_that_allows_you_to_turn/
# Shift Ctrl ] to follow links
# export MANPAGER="vim -M +MANPAGER \
# 	-c 'set nolist nomod ft=man ts=8' \
# 	-c 'set nonumber norelativenumber' \
# 	-c 'let g:showmarks_enable=0' -"\

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export P4_VERSION=2015.2
export P4V_VERSION=2015.2

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color)
    ;;
  xterm-256color|xterm)
    case "$OSTYPE" in
      linux-gnu)
        if [[ ! "$HOSTNAME" =~ "ThinkPad-T4" ]]; then
          export EDITOR='/usr/bin/gvim'
          export CSCOPE_EDITOR='/usr/bin/gvim'
          source ~/setPythonPaths
        else
          export CSCOPE_EDITOR='/usr/bin/gvim -v'
        fi
        alias ls='ls -G --color --classify'
        export GTAGSCONF=~/dotfiles/globalrc
        ;;
      *)
        export EDITOR='/usr/local/bin/gvim -f'
        export CSCOPE_EDITOR='/usr/local/bin/gvim'
        alias ls='ls -G -F'
        ;;
    esac
    ;;
  tmux-256color|screen-256color)
    export EDITOR='vim'
    export CSCOPE_EDITOR='vim'
    export SVN_EDITOR='/usr/bin/gvim -f -v'
    alias ls='ls -G --color --classify'
    ;;
  *)
    # tmux runs here
    export EDITOR='/usr/bin/gvim'
    export CSCOPE_EDITOR='/usr/bin/gvim'
    ;;
esac

sps() {
      python -c "import sys; dirs = sys.argv[1].split('/'); print '/'.join(d[:2] for d in dirs[:-1]) + '/' + dirs[-1]" $PWD
    }

# If this is an xterm set the title to user@host:dir
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

case "$TERM" in
  linux)
      ;;
  xterm-256color|screen-256color)
    case "$OSTYPE" in
      linux-gnu)
        if [[ ! "$HOSTNAME" =~ "ThinkPad-T4" ]]; then
          PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(eval "sps")\[\033[00m\]\$ '
          source ~/.git-prompt.sh
          PROMPT_COMMAND='q="- $(__git_ps1 "(%s)") $(date +%T)"; while [[ ${#q} -lt $COLUMNS ]]; do q="${q:0:1}$q"; done; echo -e "\033[0;32m$q";'
        fi
        ;;
      *)
        # https://github.com/b-ryan/powerline-shell
        if [[ ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
          PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
        fi
        ;;
    esac
    ;;
  xterm*|rxvt*)
    if [[ ! "$HOSTNAME" =~ "ThinkPad-T4" ]]; then
      export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
    ;;
  *)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    source ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases

alias 3906-8ipmi='ipmitool -H 10.183.49.118 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias b='cd ..'
alias duck="BROWSER=w3m ddgr "
alias findh="find ~  -type d  -name '.?*' -prune -o -print"
alias h='history'
alias la='ls -A'
alias ll='ls -l'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias Ufispace-fabric-1='ipmitool -H 10.183.83.130 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-fabric-1bmc='ipmitool -H 10.183.83.130 -U admin -P admin -I lanplus mc reset cold'
alias Ufispace-fabric-1pwr='ipmitool -H 10.183.83.130 -U admin -P admin -I lanplus chassis power cycle'
alias Ufispace-fabric-2='ipmitool -H 10.183.83.134 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-fabric-3='ipmitool -H 10.183.83.156 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-fabric-4='ipmitool -H 10.183.83.158 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-fabric-5='ipmitool -H 10.183.83.160 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-1='ipmitool -H 10.183.83.132 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-2='ipmitool -H 10.183.83.136 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-3='ipmitool -H 10.183.83.138 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-4='ipmitool -H 10.183.83.140 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-5='ipmitool -H 10.183.83.150 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-6='ipmitool -H 10.183.83.152 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-7='ipmitool -H 10.183.83.154 -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-fabric-sj='ipmitool -H 10.33.22.17  -U admin -P admin -I lanplus -e [ sol activate'
alias Ufispace-packet-sj='ipmitool -H 10.33.22.14  -U admin -P admin -I lanplus -e [ sol activate'
alias p4h='p4 changes -l -m1 "...#have"'
alias p4-syncable='p4 changes -L "...#>have"'
alias p='cd -'
alias psrt='ps -eHo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm'
alias Superm7='ipmitool -H 10.183.49.117 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias Superm7p='ipmitool -H 10.183.49.117 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias weather='curl -4 http://wttr.in'
alias bt2='babeltrace2 --clock-gmt --clock-date'
alias week='date +%V'
alias rgg='rg -g '"'"'!oneos-linux'"'"''
alias vout='vim $($(fc -ln -1))'
PATH=${PATH}:/home/rbelaire/ybin
alias ysrc='cd /localdata/rbelaire/yocto/source/evernight'
alias ybld='cd /localdata/rbelaire/yocto/builds'
# alias git-vimunstaged='$EDITOR $(git status -s | cut -f3 -d" ")'
# alias gitlog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20[%cn] %s"'


findlastest() {
  find . -name "$1" -exec ls -latR {} +
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f ${HOME}/.git-completion.bash ]; then
    source ${HOME}/.git-completion.bash
    export GIT_PS1_SHOWDIRTYSTATE=1
fi

if [ -f  ~/.bash_completion_lib.d/completions/complete/gocompletion.sh ]; then
  source ~/.bash_completion_lib.d/completions/complete/gocompletion.sh
fi

if [ -f  ~/bash_completion_lib-1.3.1/bash_completion_lib ]; then
  source ~/bash_completion_lib-1.3.1/bash_completion_lib
fi

if [[ ! "$HOSTNAME" =~ "ThinkPad-T4" ]]; then
  if [ -f  /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

if [ -f  ${HOME}/.bash_completion_lib.d/completions/complete/bb.completion ]; then
  source ${HOME}/.bash_completion_lib.d/completions/complete/bb.completion
fi

if [ -f  ${HOME}/.bash_completion_lib.d/completions/complete/bbconf.completion ]; then
  source ${HOME}/.bash_completion_lib.d/completions/complete/bbconf.completion
fi

if [ -f  ${HOME}/.bash_completion_lib.d/completions/complete/localize.completion ]; then
  source ${HOME}/.bash_completion_lib.d/completions/complete/localize.completion
fi

if [ -f  ${HOME}/.bash_completion_lib.d/completions/complete/gitm.completion ]; then
  source ${HOME}/.bash_completion_lib.d/completions/complete/gitm.completion
fi

if [ -f  ${HOME}/.bash_completion_lib.d/completions/complete/git-completion.bash ]; then
  # source ${HOME}/.bash_completion_lib.d/completions/complete/git-completion.bash
  :
fi

if [ -f  ${HOME}/.bash_completion_lib.d/completions/complete/bitbake ]; then
  source ${HOME}/.bash_completion_lib.d/completions/complete/bitbake
fi

if [ -f  ~/.bash_completion_lib.d/completions/complete/global.completion ]; then
  source ~/.bash_completion_lib.d/completions/complete/global.completion
fi

if [ -f  ~/.local/bin/bashmarks.sh ]; then
  source ~/.local/bin/bashmarks.sh
fi

if [ -f  /etc/profile.d/vte.sh ]; then
  source /etc/profile.d/vte.sh
fi

if [ -f  ${HOME}/.expect-liter ]; then
  source ${HOME}/.expect-literc
fi

## BABS issue
umask 002

export P4USER="rbelaire"
export P4PORT="on-p4proxy1.ciena.com:2003"
export P4CONFIG=".p4config.txt"
export P4MERGE="/opt/tools/bin/p4merge"
export P4EDITOR="gvim -f"
export P4DIFF=meld p4 diff


dnif () {
    # Recursively list a file from PWD up the directory tree to root
    [[ -n $1 ]] || { echo "dnif [ls-opts] name"; return 1; }
    local THERE=$PWD RC=2
    while [[ $THERE != / ]]
        do [[ -e $THERE/${2:-$1} ]] && { ls ${2:+$1} $THERE/${2:-$1}; RC=0; }
            THERE=$(dirname $THERE)
        done
    [[ -e $THERE/${2:-$1} ]] && { echo ${2:+$1} /${2:-$1}; RC=0; }
    return $RC
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.vim/bundle/fzf/shell/key-bindings.bash ] && source ~/.vim/bundle/fzf/shell/key-bindings.bash
export FZF_TMUX='0'
# https://superuser.com/questions/1103963/neovim-fzf-hidden-files
# export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export FZF_CTRL_T_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

[ -f ~/code/forgit/forgit.plugin.sh ] && source ~/code/forgit/forgit.plugin.sh

# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

function tabname {
  if [ -z $TMUX ] ; then
    printf "\e]1;$@\a"
  else
   tmux rename-window $@
  fi
}

export "GPG_TTY=$(tty)"
export "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh"

# https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export RIPGREP_CONFIG_PATH=~/.ripgreprc

export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments

vimq() {
    vim -q <(rg --vimgrep $1)
}

# https://threkk.medium.com/how-to-use-bookmarks-in-bash-zsh-6b8074e40774
if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi

# vim: tabstop=2:expandtab:shiftwidth=2:nowrap

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="${HOME}/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
. "$HOME/.cargo/env"
