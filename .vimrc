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



" Set colorscheme to nordic
colorscheme nord


"Custom Settings
set ts=4 sw=4
set colorcolumn=100
