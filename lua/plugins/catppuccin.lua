-- Theme 
return {
	"catppuccin/nvim", 
	name = "catppuccin", 
	lazy = false,
	priority = 1000,
	-- config automatically calls require().setup()
	config = function()
		vim.cmd.colorscheme "catppuccin"
	end
}
