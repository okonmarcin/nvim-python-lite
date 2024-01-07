local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignored_patterns = { '__pycache__', 'site-packages' },
	},
})
require("telescope").load_extension "file_browser"
