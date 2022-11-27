call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'rebelot/kanagawa.nvim'
Plug 'chriskempson/base16-vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'sindrets/diffview.nvim'
Plug 'preservim/nerdcommenter'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'

Plug 'projekt0n/github-nvim-theme'


call plug#end()
set encoding=utf-8

let g:python_highlight_all = 1
set splitbelow
set splitright
set encoding=utf-8

syntax on
set background=dark
set clipboard=unnamedplus
set t_Co=256 " Enable 256 colors
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
set updatetime=300

autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
"
filetype plugin on
highlight Normal ctermbg=None
autocmd StdinReadPre * let s:std_in=1
syntax enable

"Buffers navigation by ctrl h ctrl l
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-x> :bd!<CR>
map ; :

" ctrl t opens terminal
map <C-t> :terminal<CR>
" terminal remap to ctrl \
tnoremap <C-\> <C-\><C-n>


let g:rustfmt_autosave = 1

"telescope
noremap <leader>w <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <C-Space> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>S <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>j <cmd>lua require('telescope.builtin').jumplist()<cr>

"nvim-tree
nnoremap <C-n> :NvimTreeFocus<CR>
nnoremap <C-p> :NvimTreeToggle<CR>


set completeopt=menu,menuone,noselect
autocmd CursorHold,CursorHoldI * :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

lua <<EOF
local default_colors = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used

local default_colors = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
local new_colors = {
    bg = "#181818",
}

require'kanagawa'.setup({ overrides = {}, colors = new_colors })
EOF

colorscheme kanagawa

lua <<EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    pickers = { find_files = { hidden = true } },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {},
    layout_config = { preview_width = 0.5, width = 0.95, height = 0.95 },
    file_ignore_patterns = {},
    path_display={"truncate"},
    winblend = 0,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
  }
}
EOF

lua <<EOF
require("bufferline").setup{}
require'nvim-web-devicons'.get_icons()
require('lualine').setup{}
require("nvim-tree").setup()

-- this will affect all the hl-groups where the redefined colors are used

local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', "<cmd> Telescope lsp_definitions<CR>", bufopts)
  vim.keymap.set('n', 'gD', ":vs<CR><C-w><C-w> <cmd> Telescope lsp_definitions<CR>", bufopts)
  vim.keymap.set('n', 'gi', "<cmd> Telescope lsp_implementations<CR>", bufopts)
  vim.keymap.set('n', 'gI', ":vs<CR><C-w><C-w> <cmd> Telescope lsp_implementations<CR>", bufopts)
  vim.keymap.set('n', 'gy', "<cmd> Telescope lsp_type_definitions<CR>", bufopts)
  vim.keymap.set('n', 'gY', ":vs<CR><C-w><C-w> <cmd> Telescope lsp_type_definitions<CR>", bufopts)
  vim.keymap.set('n', 'gr', "<cmd> Telescope lsp_references<CR>", bufopts)
  vim.keymap.set('n', 'gR', ":vs<CR><C-w><C-w> <cmd> Telescope lsp_references<CR>", bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup {

  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

      mapping = {
         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
         ["<C-f>"] = cmp.mapping.scroll_docs(4),
	 ["<C-n>"] = cmp.mapping.select_next_item(),
	 ["<C-p>"] = cmp.mapping.select_prev_item(),
         ["<C-e>"] = cmp.mapping.close(),
         ["<c-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
         },
      },
      formatting = {
         format = lspkind.cmp_format {
            with_text = true,
            menu = {
               buffer   = "[buf]",
               nvim_lsp = "[LSP]",
               path     = "[path]",
            },
         },
      },

      sources = {
         { name = "nvim_lsp"},
         { name = "path" },
         { name = "buffer" , keyword_length = 5},
      },
      experimental = {
         ghost_text = true
      }
}
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
require('lspconfig')['rust_analyzer'].setup {
  on_attach = on_attach,
}
EOF


