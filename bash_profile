# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

######################################################
####        LOGIN only, not tab or xterm          ####
######################################################

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [[ '' = "$TMUX" ]]; then
  # set PATH so it includes user's private bin if it exists
  CHECKME=~/usr/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=~/usr/bin/git-config/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=/opt/tools/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=~/ybin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=~/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=~/.local/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=~/code/diff-so-fancy
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=~/go/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
  CHECKME=usr/local/sbin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
fi

# New dotfile stuff
dots=~/dotfiles
pushd $dots > /dev/null
source ~/complete/bash_completion.d/git
source git-completion.bash
source colours
popd > /dev/null

if [ "$HOSTNAME" = "RBELAIRE-LVDQ" ]; then
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && source $(brew --prefix)/etc/profile.d/autojump.sh

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

if [ "$HOSTNAME" = "ThinkPad-T420" ]; then
  export iterm2_hostname=thinkpad.belaire.net
fi

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

SOURCEME=~/complete/bash_completion.d/git
if [ -f $SOURCEME ] ; then source $SOURCEME; fi
