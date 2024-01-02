require("lspconfig").pyright.setup{}
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
