require("plugins")
require("plugins_config.telescope_conf")
require("plugins_config.lualine_conf")
require("plugins_config.lsp_conf")
require("plugins_config.harpoon_conf")

vim.cmd.colorscheme "catppuccin"
vim.o.background = 'dark'
vim.o.splitbelow = true
vim.wo.number = true
vim.o.guicursor = 'i:block'
vim.g["deoplete#enable_at_startup"] = 1

-- Change leader key
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
vim.keymap.set('n', ';', ':')
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
map('t', '<Esc>', '<C-\\><C-n>', {})

telescope_builtins = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope_builtins.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtins.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtins.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtins.help_tags, {})
vim.keymap.set('n', '<leader>fr', telescope_builtins.lsp_references, {})
vim.keymap.set('n', '<leader>fd', telescope_builtins.lsp_definitions, {})
vim.keymap.set('n', '<leader>fgb', telescope_builtins.git_branches, {})
-- Disable arrows in nmode
for _, mode in pairs({ 'n', 'v', 'x' }) do
	for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
		vim.keymap.set(mode, key, '<nop>')
	end
end
