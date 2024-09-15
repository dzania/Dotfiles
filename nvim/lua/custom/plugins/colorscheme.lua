return {
  'aktersnurra/no-clown-fiesta.nvim',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("no-clown-fiesta").setup({
      transparent = true, -- Enable this to disable the bg color
    })
    vim.cmd('colorscheme no-clown-fiesta')
  end,
}
