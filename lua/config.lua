vim.cmd.colorscheme "catppuccin-frappe"
vim.g['deoplete#enable_at_startup'] = 1
vim.g['deoplete#sources#jedi#show_docstring'] = 0
vim.o.background = 'dark'
vim.o.splitbelow = true
vim.wo.number = true
vim.o.guicursor = 'i:block'

vim.api.nvim_create_autocmd({"InsertLeave", "CompleteDone"}, {
    pattern = "*",
    command = "if pumvisible() == 0 | pclose | endif"
 })

