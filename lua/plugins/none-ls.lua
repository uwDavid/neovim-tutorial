return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,
				-- javascript, typescript, json
				null_ls.builtins.formatting.biome,
				-- golang
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports,
				-- python
				null_ls.builtins.formatting.black,
				-- misc
				null_ls.builtins.formatting.yamlfmt,
			},
		})

		-- key maps --
		-- format file
		vim.keymap.set("n", "<C-s>", vim.lsp.buf.format, {})
	end,
}
