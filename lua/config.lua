vim.cmd("colorscheme tokyonight")
vim.g.jedi_autocompletions_enabled = 0
vim.g.jedi_use_splits_not_buffers = "right"
vim.g.neomake_python_enabled_makers = {'pylint'}
vim.o.background = 'dark'
vim.o.splitbelow = true
vim.wo.number = true
vim.o.guicursor = 'i:block'

vim.api.nvim_create_autocmd({"InsertLeave", "CompleteDone"}, {
    pattern = "*",
    command = "if pumvisible() == 0 | pclose | endif"
 })

 vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
	if #vim.api.nvim_list_wins() == 1 and vim.fn.argc() == 0 then
	    vim.cmd('NERDTree') 
    	end
    end
})
