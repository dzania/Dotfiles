return {
  'rmagatti/goto-preview',
  config = function ()
    require('goto-preview').setup {}
-- Key mappings for goto-preview plugin
    vim.api.nvim_set_keymap('n', 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gpt', "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true, silent = true })
    -- Only set if you have telescope installed
    vim.api.nvim_set_keymap('n', 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true, silent = true })
  end
}
