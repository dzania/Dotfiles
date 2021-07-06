set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'neoclide/coc.nvim'
Plugin 'chuling/equinusocio-material.vim'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'ap/vim-css-color'
Plugin 'Brettm12345/moonlight.vim'
Plugin 'alvan/vim-closetag'
Plugin 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
Plugin 'vim-python/python-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'rainglow/vim'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdcommenter'
Plugin 'ryanoasis/vim-devicons'
Plugin 'edkolev/tmuxline.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



au BufNewFile,BufRead *.html set filetype=htmldjango

let g:python_highlight_all = 1
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
""
au BufNewFile,BufRead *.js,*.css      
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set autoindent
    set smarttab
    set cindent
    set expandtab

let python_highlight_all=1

syntax on
set background=dark
set clipboard=unnamedplus
set t_Co=256                         " Enable 256 colors
set t_ut=
set termguicolors
set term=xterm-256color
set laststatus=2
set nu
set mouse=a
set ai
set smartindent
set guioptions-=e
set showtabline=2




highlight Normal ctermbg=None
autocmd StdinReadPre * let s:std_in=1
syntax enable
let g:prettier#autoformat = 0
"colorscheme
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_close_shortcut = '<leader>>'

set runtimepath^=~/.vim/bundle/tabulous

"remaps
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
map ;  :Files<CR>
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
vnoremap <C-y> "+y<CR>
"
"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"let g:lightline = {
      "\ 'colorscheme': 'equinusocio_material',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
      "\ },
      "\ }

let g:equinusocio_material_style = 'darker'
colorscheme equinusocio_material
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF


