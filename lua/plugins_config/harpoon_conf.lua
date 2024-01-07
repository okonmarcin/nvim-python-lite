local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "hm", function() harpoon:list():append() end)
vim.keymap.set("n", "hp", function() harpoon:list():prev() end)
vim.keymap.set("n", "hn", function() harpoon:list():next() end)

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "harpoon",
	callback = function()
		vim.opt.winblend = 50
	end,
})
