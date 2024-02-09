return {
  "nvim-tree/nvim-tree.lua",
  config = function()
  require("nvim-tree").setup({
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
          git = true,
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
            unstaged = "✗ ",
            staged = "✓ ",
            unmerged = " ",
            renamed = "➜ ",
            untracked = " U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  })
  vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-p>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  end,
}
