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
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'webdevel/tabulous'
Plugin 'neoclide/coc.nvim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'itchyny/lightline.vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



set splitbelow
set splitright
set encoding=utf-8

au BufNewFile,BufRead *.py
    \| set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \|set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2



let python_highlight_all=1

syntax on
set mouse=a 
set laststatus=2
set nu
set showtabline=2
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

packloadall
set runtimepath^=~/.vim/bundle/tabulous

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nnoremap <F2> :w<CR>
nnoremap <F3> :q<CR>
nnoremap <F4> :NERDTree<CR>
let b:coc_diagnostic_disable = 1
