return {
	{
		-- Mason - help manage and install LSP
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- Mason-lspconfig - help bridge between LSP and LSP-config
		-- Ensure_installed help auto install language servers
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- install language servers here
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		-- Nvim-lspconfig
		-- Connect Neovim to language servers
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- set up language servers here
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			-- to provide info on buffer from language server
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- gd - go to defintion
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			-- code action
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
