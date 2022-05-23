"-----------------------------
"           Plugins
"-----------------------------
"install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug plugins list
call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
call plug#end()


"-----------------------------
"           Settings
"-----------------------------
"NERDTree
"autocmd VimEnter * NERDTree

"statusbar
set ttimeoutlen=0

"""
" Whitespace Formatting
"""
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=100
set listchars=trail:␣
set list
" highlights trailing whitespace
" (https://vim.fandom.com/wiki/Highlight_unwanted_spaces)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=magenta guibg=magenta
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" need to fix to make less annoying
set spell spelllang=en_us

set clipboard=unnamedplus

set number relativenumber


"""
" Theming
"""
"change color of comments so they are readable when highlighted
colorscheme gruvbox
set cursorline
