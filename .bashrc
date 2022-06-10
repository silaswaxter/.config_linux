# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#####
# Theming
#####
# Primary Prompt Variable (the stuff at the start of the cli)
PS1='\[\e[1;33m\][\W]$ \[\e[m\]'

LS_COLORS=$LS_COLORS:'di=1;33:' ; export LS_COLORS


# Aliases
alias terminal='alacritty &'
alias ls='ls --color=auto'
alias ll='ls -la'

#PATH modifications
PATH=${PATH}:/opt/intelFPGA/18.1/quartus/bin:/opt/intelFPGA/20.1/modelsim_ase/bin
