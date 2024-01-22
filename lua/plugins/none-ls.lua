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
				null_ls.builtins.diagnostics.biome,
				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
			},
		})

		-- key maps --
		-- format file
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
