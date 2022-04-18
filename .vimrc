""""""""""
" Plug-In Settings
""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Start of vim-plug plugins
call plug#begin(expand('~/.vim/plugged'))

Plug 'arcticicestudio/nord-vim'

" Start of vim-plug plugins
call plug#end()


""""""""""
" Vim settings
""""""""""
colorscheme nord

set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=100

"spell check
set spell spelllang=en_us

"set primary buffer
set clipboard=unnamedplus

"hybrid line numbers
set number relativenumber

"display current file in statusbar
set laststatus=2
set statusline+=%F
