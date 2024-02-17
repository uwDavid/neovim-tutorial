-- Theme 
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	-- config automatically calls require().setup()
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				treesitter = true,
				nvimtree = true,
				markdown = true
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
