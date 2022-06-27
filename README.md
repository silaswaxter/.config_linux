# About this Repo
This repo tracks my config files for the user-level linux programs that I use.  The configuration 
files in this utillity are symbolically linked to my home directory. To aid in this process there 
is a script called [`recursive_symlink_config_files.sh`](##installation).

## Installation
1. Install and setup the [pre-commit](https://pre-commit.com/) framework for this repository by 
   following the [installation guide](https://pre-commit.com/#install).
2. Create symbolic links to your home directory by executing the script, 
   `recursive_symlink_config_files.sh`.
    - This script creates symbolic links to the passed directory.  It ignores files/folders  
      listed in `symlink_ignore_hidden_files` and those which are not hidden.

## Git Hooks
I'm currently using a pre-commit git hook to track the packages installed on the system;  the list
is filtered using an ignore file, and the list is sub-divided into native and foreign packges (eg  
yay).  The pre-commit git hook is managed by a git-hook framework called 
[pre-commit](https://pre-commit.com/).  

## Configuration Decsions (notes to self)
### Display Scripts (.screenlayout)
`auto_display.sh` is a parent script that will call specific subscripts and will handle any 
scaling etc.  The subscripts such as mobile.sh should only contain a basic xrandr command and can
be configured with arandr (xrandr GUI);  migrating the scripts for a new system is faster when a
gui is used.
### Pacwall
Currently handles the setting of the wallpaper.  Entities wanting to update the wallpaper should
call pacwall.
### i3
Autostarts some applications because many diplay managers (like lightdm) do not run any x files 
(like .xinitrc).

