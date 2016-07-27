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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export P4_VERSION=2015.1
export P4V_VERSION=2015.1

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
  xterm-256color)
    case "$OSTYPE" in
      linux-gnu)
        export EDITOR='/usr/bin/gvim'
        export CSCOPE_EDITOR='/usr/bin/gvim'
        export SVN_EDITOR='/usr/bin/gvim -f'
        alias ls='ls -G --color --classify'
        ;;
      *)
        export EDITOR='/usr/local/bin/gvim'
        export CSCOPE_EDITOR='/usr/local/bin/gvim'
        export SVN_EDITOR='/usr/local/bin/gvim -f'
        alias ls='ls -G -F'
        ;;
    esac
    ;;
  *)
    export EDITOR='/usr/bin/gvim'
    export CSCOPE_EDITOR='/usr/bin/gvim'
    export SVN_EDITOR='/usr/bin/gvim -f'
    ;;
esac

sps() {
      python -c "import sys; dirs = sys.argv[1].split('/'); print '/'.join(d[:2] for d in dirs[:-1]) + '/' + dirs[-1]" $PWD
    }

# Comment in the above and uncomment this below for a color prompt
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm-256color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]$(eval "sps")\[\033[00m\]\$ '
    source ~/.git-prompt.sh
    PROMPT_COMMAND='q="- $(__git_ps1 "(%s)") $(date +%T)"; while [[ ${#q} -lt $COLUMNS ]]; do q="${q:0:1}$q"; done; echo -e "\033[0;32m$q";'
    ;;
  xterm*|rxvt*)
    export PS1=' '
    #export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;35m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
    #PS1='$(eval "sps")$ '
    #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    #source ~/.git-prompt.sh
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
if [ "$TERM" == "dumb" ]; then
    alias ols="ls -la --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
elif [ "$TERM" == "xterm-256color" ]; then
    #alias ls='ls -G --color --classify'
    alias ll='ls -l'
elif [ "$TERM" == "xterm" ]; then
    alias ls='ls --color=auto --classify'
else
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias ols="ls -la --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

alias ll='ls -l'
alias la='ls -A'
#alias ls='ls -lut'
alias h='history'
alias b='cd ..'
alias p='cd -'
alias psrt='ps -eHo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm'
alias p4-syncable='p4 changes -L "...#>have"'
alias p4h='p4 changes -l -m1 "...#have"'
alias psrt='ps -eHo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm'
alias gitlog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20[%cn] %s"'
alias weather='curl -4 http://wttr.in'
alias git-vimunstaged='vim $(git st -s | cut -f3 -d" ")'
alias git-gvimunstaged='gvim $(git st -s | cut -f3 -d" ")'
alias superm1i='ipmitool -H 10.183.49.111 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm2i='ipmitool -H 10.183.49.112 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm3i='ipmitool -H 10.183.49.113 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm4i='ipmitool -H 10.183.49.114 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm5i='ipmitool -H 10.183.49.115 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm6i='ipmitool -H 10.183.49.116 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm7i='ipmitool -H 10.183.49.117 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
alias superm8i='ipmitool -H 10.183.49.118 -U ADMIN -P ADMIN -e [ -I lanplus sol activate'
#
alias superm1p='ipmitool -H 10.183.49.111 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm2p='ipmitool -H 10.183.49.112 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm3p='ipmitool -H 10.183.49.113 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm4p='ipmitool -H 10.183.49.114 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm5p='ipmitool -H 10.183.49.115 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm6p='ipmitool -H 10.183.49.116 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm7p='ipmitool -H 10.183.49.117 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'
alias superm8p='ipmitool -H 10.183.49.118 -U ADMIN -P ADMIN -e [ -I lanplus power cycle'

alias findh="find ~  -type d  -name '.?*' -prune -o -print"

[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    export GIT_PS1_SHOWDIRTYSTATE=1
fi

if [ -f ~/.bash_completion_lib.d/completions/complete/gocompletion.sh ]; then
      source ~/.bash_completion_lib.d/completions/complete/gocompletion.sh
fi

if [ -f ~/bash_completion_lib-1.3.1/bash_completion_lib ]; then
    source ~/bash_completion_lib-1.3.1/bash_completion_lib
fi

test -e ${HOME}/.bash_completion_lib.d/completions/complete/bb.completion && \
  source ${HOME}/.bash_completion_lib.d/completions/complete/bb.completion

test -e ${HOME}/.bash_completion_lib.d/completions/complete/bitbake && \
  source ${HOME}/.bash_completion_lib.d/completions/complete/bitbake

if [ -f ~/code/to/to.sh ]; then
    source ~/code/to/to.sh
fi

if [ -f ~/.local/bin/bashmarks.sh ]; then
    source ~/.local/bin/bashmarks.sh
fi

if [ -f /etc/profile.d/vte.sh ]; then
    source /etc/profile.d/vte.sh
fi

tools=()
tools=( "${tools[@]}" "powerpc" "/usr/local/ciena/powerpc-e500-linux-gnuspe-20130325/bin/powerpc-e500-linux-gnuspe- " )
tools=( "${tools[@]}" "mips"    "/usr/local/ciena/mips-unknown-linux-gnu-20080904/bin/mips-unknown-linux-gnu-" )
tools=( "${tools[@]}" "mips64"  "/usr/local/ciena/mips64-octeon-linux-gnu-20080904/bin/mips64-octeon-linux-gnu-" )
tools=( "${tools[@]}" "i486"  "/usr/local/ciena/i486-sim-linux-gnu-20110802/bin/i486-sim-linux-gnu-" )

for ((i=0; i<"${#tools[@]}"; i++)); do
  name="${tools[${i}]}"
  ((i+=1))
  prefix="${tools[${i}]}"

  eval "export ${name}=${prefix}"
  eval "alias ${name}-ddd='\${${name}}ddd --debugger \${${name}}gdb'"

  for prog in addr2line \
              ar \
              as \
              c++ \
              cpp \
              g++ \
              gcc \
              gdb \
              ld \
              nm \
              objcopy \
              objdump \
              ranlib \
              readelf \
              size \
              strip ; do
    eval "alias ${name}-${prog}='\${${name}}${prog}'"
  done
done

## BABS issue
umask 002

export P4USER="rbelaire"
export P4PORT="onxp4proxy1.ciena.com:2003"
export P4CONFIG=".p4config.txt"
#export P4DIFF="diff -Naur"
#export P4DIFF="meld"
export P4MERGE="/corp/tools/perforce/current/bin/p4merge"
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
