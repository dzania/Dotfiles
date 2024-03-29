call plug#begin()
"cosmetic
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rebelot/kanagawa.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'chriskempson/base16-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'projekt0n/github-nvim-theme'
Plug 'arkav/lualine-lsp-progress'
Plug 'goolord/alpha-nvim'

"tools
Plug 'sindrets/diffview.nvim'
Plug 'preservim/nerdcommenter'
Plug 'rmagatti/goto-preview'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
"Formatting
Plug 'mhartington/formatter.nvim'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim',
Plug 'williamboman/mason.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Vsnip
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
"Writing

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'subnut/vim-iawriter'

call plug#end()

set encoding=utf-8
let g:python_highlight_all = 1
set splitbelow
set splitright

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
set cmdheight=1
set ignorecase
set smartcase
set completeopt=menu,menuone,preview,noselect,noinsert
set undolevels=100
set undodir=~/.vimdid
set undofile
set number relativenumber
set nu rnu
set noswapfile

autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab

"Highlight in nerdtree
autocmd VimEnter,WinEnter,BufWinEnter NvimTree* setlocal cursorline
autocmd VimEnter,WinEnter,BufWinEnter NvimTree* setlocal guicursor="a:noCursor"

"
filetype plugin on
highlight Normal ctermbg=None
autocmd StdinReadPre * let s:std_in=1
syntax enable
hi LineNr guibg=none guifg=none

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

"format

"goto-preview
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
" Only set if you have telescope installed
nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

"nvim-tree
nnoremap <C-n> :NvimTreeFocus<CR>
nnoremap <C-p> :NvimTreeToggle<CR>

autocmd CursorHold,CursorHoldI * :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

lua <<EOF
require("catppuccin").setup {
    color_overrides = {
        all = {
		base = "#202124",
		mantle = "#202124",
		crust = "#202124",
        },
    }
}
EOF

colorscheme base16-default-dark


"Telescope
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
    prompt_prefix = "   ",
    selection_caret = "  ",
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
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
  }
}
EOF

lua <<EOF
require("mason").setup()
require("mason-null-ls").setup({})
require("bufferline").setup{}
require'nvim-web-devicons'.get_icons()
require('goto-preview').setup{default_mappings = true}
require("ibl").setup({
	indent = {
		char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
	},
	scope = {
       enabled = true,
       show_start = false,
       show_end = false,
       injected_languages = false,
       highlight = { "Function", "Label" },
       priority = 500,
   }
})

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
--- language servers
local lsp = require'lspconfig'

lsp.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
          diagnostics = {
              enable = true,
              disabled = {"unresolved-proc-macro"},
              enableExperimental = true,
          },
}}}

-- local servers = { 'pyright', 'rust_analyzer', 'clangd', 'tsserver',
-- 'jsonls', "gopls", "dockerls", "cssls", "yamlls"}


-- Ensure the servers above are installed
require("mason-lspconfig").setup_handlers {
-- The first entry (without a key) will be the default handler
-- and will be called for each installed server that doesn't have
-- a dedicated handler.
function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
	on_attach = on_attach
}
end,
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
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
    },
    documentation = { -- no border; native-style scrollbar
    	border = 'rounded',
    },
    },

      mapping = {
         ["<C-f>"] = cmp.mapping.scroll_docs(-4),
         ["<C-d>"] = cmp.mapping.scroll_docs(4),
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
      focusable = true,
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
EOF

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"Lualine
lua <<EOF
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return " 🐈 " .. str .. " "
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 2,
}


local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end


lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		theme = "catppuccin",
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { lsp_progress },
		-- lualine_x = { "encoding", "fileformat", "filetype" }
		lualine_x = { diagnostics, diff,  "encoding", filetype },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
EOF

"Nvimtree
lua <<EOF
require("nvim-tree").setup({
  filters = {
    dotfiles = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = true,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})
EOF

" formatting
lua <<EOF
local util = require "formatter.util"
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
EOF
nnoremap <silent> <leader>f :lua vim.lsp.buf.format() <CR>
nnoremap <silent> <leader>F :FormatWrite<CR>

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
