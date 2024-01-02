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
