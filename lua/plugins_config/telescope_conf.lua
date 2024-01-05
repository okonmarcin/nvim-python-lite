telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignored_patterns = { '__pycache__', 'site-packages' },
	},
})
