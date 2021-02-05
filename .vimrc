set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
" ...
"
"
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'itchyny/lightline.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'jistr/vim-nerdtree-tabs'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



set splitbelow
set splitright
set encoding=utf-8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent
    \ set fileformat=unix |


au BufRead,BufNewFile *.py,*.pyw,*.c,*.h 
let python_highlight_all=1
syntax on
:set mouse=a 
set laststatus=2
set nu
nnoremap <C-y > "+y
vnoremap <C-y> "+y
let g:Powerline_symobls = 'fancy'
highlight Normal ctermbg=None
autocmd StdinReadPre * let s:std_in=1
syntax enable
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:lightline = {'colorscheme' : 'tokyonight'}

imap <F5> <Esc>:w<CR>:!clear;python %<CR>
