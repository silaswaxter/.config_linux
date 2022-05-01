#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Primary Prompt Variable (the stuff at the start of the cli)
PS1='\[\e[1;36m\][\W]$ \[\e[m\]'

# Aliases
alias terminal='alacritty &'
alias ls='ls --color=auto'
alias ll='ls -la'

#PATH modifications
PATH=${PATH}:/opt/intelFPGA/18.1/quartus/bin:/opt/intelFPGA/20.1/modelsim_ase/bin
