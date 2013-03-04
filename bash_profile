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
  . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
  PATH=~/bin:"${PATH}"
fi

if [ -d /usr/local/ciena/m68k-elf-tools-20080416/bin ] ; then
  PATH=/usr/local/ciena/m68k-elf-tools-20080416/bin:"$PATH"
fi

#if [ -d /corp/tools/altera/latest/quartus/bin ] ; then
  #PATH=/corp/tools/altera/latest/quartus/bin:"$PATH"
#fi

#if [ -d /corp/tools/altera/latest/nios2eds/bin ] ; then
  #PATH=/corp/tools/altera/latest/nios2eds/bin:"$PATH"
#fi

#if [ -d /corp/tools/altera/latest/nios2eds/bin/nios2-gnutools/H-i686-pc-linux-gnu/bin ] ; then
  #PATH=/corp/tools/altera/latest/nios2eds/bin/nios2-gnutools/H-i686-pc-linux-gnu/bin:"$PATH"
#fi

#if [ -d /home/rbelaire/code/nios2-linux/toolchain-build/build/nios2/bin ] ; then
  #PATH=/home/rbelaire/code/nios2-linux/toolchain-build/build/nios2/bin:"$PATH"
#fi

#if [ -d /home/rbelaire/code/git ] ; then
  #PATH=/home/rbelaire/code/git:"$PATH"
#fi

if [[ -d /corp/tools/ccollab/current || -L /corp/tools/ccollab/current ]] ; then
  PATH=/corp/tools/ccollab/current:"$PATH"
fi

if [ -f /corp/proj/centaur/common/env.sh ] ; then
  . /corp/proj/centaur/common/env.sh
fi

if [[ -d /corp/tools/perforce/current || -L /corp/tools/perforce/current ]] ; then
  PATH=/corp/tools/perforce/current/bin:"$PATH"
fi
PATH=~/usr/bin:"$PATH"
PATH=~/bin/meld/bin:"$PATH"
