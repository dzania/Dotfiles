--return {
  --'RRethy/nvim-base16',
  --lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --priority = 1000, -- make sure to load this before all the other start plugins
  --config = function()
    --vim.cmd('colorscheme base16-default-dark')
  --end,
--}
--return {
  --'Mofiqul/vscode.nvim',
  --lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --priority = 1000, -- make sure to load this before all the other start plugins
  --config = function()
    --require('vscode').load('dark')
  --end,
--}
--[[return {]]
  --[['rebelot/kanagawa.nvim',]]
  --[[lazy = false, -- make sure we load this during startup if it is your main colorscheme]]
  --[[priority = 1000, -- make sure to load this before all the other start plugins]]
  --[[config = function()]]
    --[[require('kanagawa').setup({]]
        --[[--transparent = true,         -- do not set background color]]
      --[[background = {               -- map the value of 'background' option to a theme]]
        --[[dark = "dragon",           -- try "dragon" !]]
        --[[light = "lotus"]]
    --[[},]]
    --[[})]]
      --[[vim.cmd("colorscheme kanagawa")]]
  --[[end,]]
--[[}]]
return {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      options = {
        transparent = true
      }
    })

  vim.cmd('colorscheme github_dark_default')
  end,
}
