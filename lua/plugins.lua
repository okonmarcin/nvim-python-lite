local fn = vim.fn



-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	
	use ('jiangmiao/auto-pairs')
	use ('scrooloose/nerdcommenter')
	use ('sbdchd/neoformat')
	use ('machakann/vim-highlightedyank')
	use ('nvim-lua/plenary.nvim')
	use {
	    'nvim-treesitter/nvim-treesitter',
	    run = ':TSUpdate'
	}
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use ('lewis6991/gitsigns.nvim')
	use ('tpope/vim-fugitive')
	use ('junegunn/gv.vim')
	use ('ThePrimeagen/vim-be-good')
	use {
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter"
	}
	use ('nvim-tree/nvim-web-devicons')
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires =  {'nvim-tree/nvim-web-devicons', opt = true}
	}
	use {
    		"williamboman/mason.nvim",
    		"williamboman/mason-lspconfig.nvim",
    		"neovim/nvim-lspconfig",
	}
	use ('hrsh7th/cmp-nvim-lsp')
	use ('hrsh7th/cmp-buffer')
	use ('hrsh7th/cmp-path')
	use ('hrsh7th/cmp-cmdline')
	use ('hrsh7th/nvim-cmp')
	use ('hrsh7th/cmp-vsnip')
	use ('hrsh7th/vim-vsnip')
	use {
    		"ThePrimeagen/harpoon",
    		branch = "harpoon2",
    		requires = { {"nvim-lua/plenary.nvim"} }
	}
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
