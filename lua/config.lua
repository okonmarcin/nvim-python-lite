vim.cmd("colorscheme tokyonight")
vim.g.jedi_autocompletions_enabled = 0
vim.g.jedi_use_splits_not_buffers = "right"
vim.g.neomake_python_enabled_makers = {'pylint'}
vim.g['deoplete#enable_at_startup'] = 1
vim.g['deoplete#sources#jedi#show_docstring'] = 0
vim.o.background = 'dark'
vim.o.splitbelow = true
vim.wo.number = true
vim.o.guicursor = 'i:block'
require'bufferline.state'.set_offset(31, 'FileTree')

vim.api.nvim_create_autocmd({"InsertLeave", "CompleteDone"}, {
    pattern = "*",
    command = "if pumvisible() == 0 | pclose | endif"
 })

