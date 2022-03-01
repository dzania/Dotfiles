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
Plugin 'jiangmiao/auto-pairs'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'alvan/vim-closetag'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'preservim/nerdcommenter'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'akinsho/bufferline.nvim'
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'iamcco/markdown-preview.nvim' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set encoding=utf-8

let g:python_highlight_all = 1
set splitbelow
set splitright
set encoding=utf-8

syntax on
set background=dark
set clipboard=unnamedplus
set t_Co=256                         " Enable 256 colors
set t_ut=
set termguicolors
set laststatus=2
set nu
set ai
set smartindent
set guioptions-=e
set showtabline=2


highlight Normal ctermbg=None
autocmd StdinReadPre * let s:std_in=1
syntax enable

"Prettier
let g:prettier#autoformat = 0
"Rust autoformat
let g:rustfmt_autosave = 1
"Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_close_shortcut = '<leader>>'

set runtimepath^=~/.vim/bundle/tabulous

"remaps nerdtree
nnoremap <C-p> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>


"Buffers navigation by ctrl h ctrl l 
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-x> :bd!<CR>
map ; :


" remap shitty terminal binding to chad esc
tnoremap <Esc> <C-\><C-n>

"copy to sysstem clipboard
vnoremap <C-y> "+y<CR>
"
"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled =  0

set updatetime=300
set cmdheight=2
"colorscheme
colorscheme base16-default-dark
lua <<EOF
require("bufferline").setup{}
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
