local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf',function() builtin.find_files({no_ignore=true}) end, {})
vim.keymap.set('n', '<leader>fs',function() builtin.lsp_workspace_symbols() end, {})
--- vim.keymap.set('n', '<leader>pf', builtin.find_files, {no_ignore=false})
vim.keymap.set('n', '<C-P>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps',function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
