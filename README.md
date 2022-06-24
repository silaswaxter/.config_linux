# About

## Config Files
This folder contains the configuration files which are symlinked to their default location.
There is a script which automates this.


## Git Hooks
`.githooks/` contains git hook scripst;  the default location for git hooks is `.git/hooks/`, but 
this directory is obviously not tracked by the git repo meaning it is necesary to instruct git
where the hooks are.  This can be achieved by one of two methods
    1. (My prefered method, already set in my git config file.)  Update your git config to look for
       git hooks in .githooks folder by running:
       `git config core.hooksPath .githooks`
       As usual you can change the scope of the git config by adding the specific flag  
       (eg `--global`).
    2. Create a symbolic link from `.githooks` to `.git/hooks/`;  remember to use absolute paths.

Currently, a pre-commit script exists.  This script captures the native and foreign (eg yay) 
packages that are currently installed on the system;  it filters the list through an ignore file 
and saves the results.  See [Package Lists](## Package Lists).

## Package Lists
`installed_packages/` contains a script to generate lists of packages both native and foreign (eg  
yay).  These lists can be used to quickly restore the packages I use.  The script filters against  
an ignore list file.  These scripts are automatically run when
