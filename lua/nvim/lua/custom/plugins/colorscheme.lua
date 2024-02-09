--return {
  --'RRethy/nvim-base16',
  --lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --priority = 1000, -- make sure to load this before all the other start plugins
  --config = function()
    --vim.cmd('colorscheme base16-default-dark')
  --end,
--}
return {
  'Mofiqul/vscode.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('vscode').load('dark')
  end,
}
