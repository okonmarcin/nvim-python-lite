local fn = vim.fn
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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself	
	use('mbbill/undotree')
	use('windwp/nvim-autopairs')
	use('scrooloose/nerdcommenter')
	use('sbdchd/neoformat')
	use('machakann/vim-highlightedyank')
	use('nvim-lua/plenary.nvim')
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use('nvim-treesitter/nvim-treesitter-context')
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		requires = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim'
		}
	}
	use('lewis6991/gitsigns.nvim')
	use('tpope/vim-fugitive')
	use('junegunn/gv.vim')
	use('ThePrimeagen/vim-be-good')
	use('nvim-tree/nvim-web-devicons')
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-vsnip')
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip'  -- Snippets plugin
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use('lukas-reineke/indent-blankline.nvim')
	use('folke/noice.nvim')
	use('MunifTanjim/nui.nvim')
	use('rcarriga/nvim-notify')
	use('tribela/vim-transparent')
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
