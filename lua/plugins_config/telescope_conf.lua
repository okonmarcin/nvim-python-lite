local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignored_patterns = { '__pycache__', 'site-packages' },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
})
require("telescope").load_extension "file_browser"
