vim.opt.termguicolors = true
require("plugins")
require("plugins_config.telescope_conf")
require("plugins_config.lualine_conf")
require("plugins_config.lsp_conf")
require("plugins_config.harpoon_conf")
require("plugins_config.indent_conf")
require("plugins_config.noice_conf")
require("plugins_config.treesitter_conf")
require("plugins_config.autopairs_conf")

local telescope_builtins = require("telescope.builtin")
local map = vim.keymap.set

vim.cmd.colorscheme "catppuccin"
vim.o.splitbelow = true
vim.o.relativenumber = true
vim.wo.number = true
vim.o.guicursor = 'i:block'
vim.g.mapleader = ' '
vim.g.netrw_banner = false

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
map('t', '<Esc>', '<C-\\><C-n>', {})
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>so", ':source<CR>', {})
map('n', '<leader>ff', telescope_builtins.find_files, {})
map('n', '<leader>fg', telescope_builtins.live_grep, {})
map('n', '<leader>fb', ":Telescope file_browser<CR>", {})
map('n', '<leader>fh', telescope_builtins.help_tags, {})
map('n', '<leader>fr', telescope_builtins.lsp_references, {})
map('n', '<leader>fd', telescope_builtins.lsp_definitions, {})
map('n', '<leader>fgb', telescope_builtins.git_branches, {})

for _, mode in pairs({ 'n', 'v', 'x' }) do
	for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
		map(mode, key, '<nop>')
	end
end
