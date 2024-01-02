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
	use ('davidhalter/jedi-vim')
	use ('jiangmiao/auto-pairs')
	use ('scrooloose/nerdcommenter')
	use ('sbdchd/neoformat')
	use ('neomake/neomake')
	use ('terryma/vim-multiple-cursors')
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
	use ('romgrk/barbar.nvim')
	use ('folke/tokyonight.nvim')
	use ('tpope/vim-fugitive')
	use ('junegunn/gv.vim')
	use ('ThePrimeagen/vim-be-good')
	use {
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter"
	}
	use ('nvim-tree/nvim-tree.lua')
	use ('nvim-tree/nvim-web-devicons')
	use ('neovim/nvim-lspconfig')
	use {
		'Shougo/deoplete.nvim',
		run = ':UpdateRemotePlugins'
	}
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
