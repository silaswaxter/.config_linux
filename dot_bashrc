# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Theming
PS1='\[\e[1;33m\][\W]$ \[\e[m\]'

LS_COLORS=$LS_COLORS:'di=1;33:'; export LS_COLORS

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la'

# Global Environment Variables
SCREEN_BRIGHTNESS_SCRIPTS_DIR="/etc/system_config_files_linux/screen_brightness"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/silas/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/silas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/silas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/silas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

