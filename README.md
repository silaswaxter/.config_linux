# Personal Linux Config Files (dotfiles)
### A repository containing the bulk of my Linux (Arch) configurations.

## Config Files
This folder contains the configuration files which are symlinked to their default location.
There is a script which automates this.

## Package Lists
"installed_packages/" contains a script to generate lists of explicit foreign (normal pacman) and
explicit non-foreign packages (includes yay packages).  These lists can be used to quickly restore 
the packages I use.  The script filters against an ignore list file.

## Git Hooks
"git_hooks/" contains git hook scripts.  These must be symbolically linked to .git/hooks/.
The pre-commit hook will run the generate package list script for both the foreign and non-foreign 
packages, meaning commits will include a "snapshot" of the packages installed (for both pacman and 
yay).
