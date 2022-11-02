set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" dev
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'alvan/vim-closetag'
Plugin 'petobens/poet-v'
" cosmetic
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'preservim/nerdcommenter'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'akinsho/bufferline.nvim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nvim-tree/nvim-web-devicons'
Plugin 'iamcco/markdown-preview.nvim' 
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'mfussenegger/nvim-dap'
Plugin 'rcarriga/nvim-dap-ui'
Plugin 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plugin 'romgrk/barbar.nvim'
Plugin 'rafi/awesome-vim-colorschemes'

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
set t_Co=256 " Enable 256 colors
set t_ut=
set termguicolors
set laststatus=2
set nu
set ai
set smartindent
set guioptions-=e
set showtabline=2
set mouse=a
set updatetime=300
set cmdheight=1
set ignorecase 
set smartcase
set completeopt=menu,menuone,preview,noselect,noinsert
set undolevels=100
set undodir=~/.vimdid
set undofile
set number relativenumber
set nu rnu

autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
"
highlight Normal ctermbg=None
autocmd StdinReadPre * let s:std_in=1
syntax enable

"Prettier
let g:prettier#config#tab_width = 2
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#autoformat = 0
"Rust autoformat
let g:rustfmt_autosave = 1
"Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.tsx,*.jsx'
let g:closetag_close_shortcut = '<leader>>'

set runtimepath^=~/.vim/bundle/tabulous

"remaps nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>


"Buffers navigation by ctrl h ctrl l 
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-x> :bd!<CR>
map ; :

" ctrl t opens terminal
map <C-t> :terminal<CR>
" terminal remap to ctrl \ 
tnoremap <C-\> <C-\><C-n>

"copy to system clipboard
vnoremap <C-y> "+y<CR>
"
"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled =  0
"telescope
noremap <leader>w <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <C-Space> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>S <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>j <cmd>lua require('telescope.builtin').jumplist()<cr>
"coc
nmap gd <Plug>(coc-definition)
nmap gt <Plug>(coc-type-definition)
nmap gr <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)
nmap <leader>I <Plug>(coc-format)
" Scroll popup 
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

"colorscheme
let base16colorspace=256
colorscheme base16-tomorrow-night
highlight CocMenuSel ctermbg=19 guibg=#222222


lua <<EOF
require("bufferline").setup{}
require'nvim-web-devicons'.get_icons()
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
 local dap = require('dap')
 dap.adapters.python = {
   type = 'executable';
   command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
   args = { '-m', 'debugpy.adapter' };
 }
local dap = require('dap')
dap.configurations.python = {
{
type = 'python';
request = 'launch';
name = "Launch file";
program = "${file}";
pythonPath = function()
  return '/usr/bin/python'
end;
},
}

EOF
