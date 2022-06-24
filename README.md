# About this Repo
This repo tracks my config files for the user-level linux programs that I use.  The configuration 
files in this utillity are symbolically linked to my home directory. To aid in this process there 
is a script called [`recursive_symlink_config_files.sh`](##recursive-symbolic-link-script).

## Installation
### Recursive Symbolic Link Script
This script creates symbolic links to the passed directory.  It ignores files listed in 
`symlink_ignore` which is updated with a [pre-commit git hook](##git-hooks).  For usage, run the 
script with the `--help` option.

## Managing this repo
### Git Hooks
#### About
I'm currently using a pre-commit git hook to track some of the other system information that would 
be cumbersome to record, but is useful;  it currently [tracks](##package-lists) installed packages
both native and foreign (eg yay) and has an ignore file filter called `symlink_ignore`.
#### Setup
`.githooks/` contains git hook scripst;  the default location for git hooks is `.git/hooks/`, but 
this directory is obviously not tracked by the git repo meaning it is necesary to instruct git
where the hooks are.  This can be achieved by one of two methods
    1. (My prefered method, already set in my git config file.)  Update your git config to look for
       git hooks in .githooks folder by running:
       `git config core.hooksPath .githooks`
       As usual you can change the scope of the git config by adding the specific flag  
       (eg `--global`).
    2. Create a symbolic link from `.githooks` to `.git/hooks/`;  remember to use absolute paths.

### Package Lists
`installed_packages/` contains a script to generate lists of packages both native and foreign (eg  
yay).  These lists can be used to quickly restore the packages I use.  The script filters against  
an ignore list file also in this directory.

## Configuration Decsions (notes to self)
###Display Scripts (.screenlayout)
`auto_display.sh` is a parent script that will call specific subscripts and will handle any 
scaling etc.  The subscripts such as mobile.sh should only contain a basic xrandr command and can
be configured with arandr (xrandr GUI);  migrating the scripts for a new system is faster when a
gui is used.
###Pacwall
Currently handles the setting of the wallpaper.  Entities wanting to update the wallpaper should
call pacwall.
###i3
Autostarts some applications because many diplay managers (like lightdm) do not run any x files 
(like .xinitrc).

