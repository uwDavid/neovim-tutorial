-- Nvim-Tree
-- File explorer
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
	-- custom mappings
	-- vim.keymap.set('n', '<C-t>', api.tree.toggle)
	vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
	-- switch between window and editor
	vim.keymap.set("n", "<C-h>", "<C-w>h")
	vim.keymap.set("n", "<C-l>", "<C-w>l")
end

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
		})
	end,
}
