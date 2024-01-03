require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'pyright',
		'lua_ls',
		'taplo'
	}
})
require("lspconfig").pyright.setup{
	on_attach = require('lsp_compl').attach
}
require("lspconfig").lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'}
			}
		}
	}
}
require("lspconfig").taplo.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true
	}
)
