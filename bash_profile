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
  CHECKME=~/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi

  CHECKME=~/usr/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi

  CHECKME=~/usr/bin/git-config/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi

  CHECKME=/opt/tools/bin
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi

  CHECKME=/home/rbelaire/usr/bin/p4u
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi

  CHECKME=/localdata/rbelaire/yocto/source/evernight/poky/scripts
  if [ -d $CHECKME ] ; then PATH="$PATH":$CHECKME; fi
fi

# New dotfile stuff
dots=~/dotfiles
# not used yet, still hardcoded
extentions_to_source=".path"
function addToPath(){
    #if [[ $FOO =~ "fii" ]]; then
    #    echo hi
    #fi
    PATH="$1:$PATH"
}
function sourceDir(){
    for file in *; do  # sets $file to * if empty directory
        #echo "saw $file";
        if [ -d $file ] && [ $(hostname) = $file ]; then
            #echo "Recursing into $file";
            cd $file;
            sourceDir $file;
            cd ..;
        elif [[ $file == *.path ]]; then
            # echo "$file is a .path";
            source $file;
        fi
    done
}

pushd $dots > /dev/null

source git-completion.bash
source colours
#source prompt
#sourceDir

popd > /dev/null

if [ "$HOSTNAME" = "ONM-RBELAIRE-01" ]; then
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && source $(brew --prefix)/etc/profile.d/autojump.sh

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

if [[ '' = "$TMUX" ]]; then
  PATH=${PATH}:/home/rbelaire/ybin
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export PATH="/usr/local/sbin:$PATH"
