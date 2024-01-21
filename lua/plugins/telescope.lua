-- Telescope
-- Fuzzy finder for files 
return	{ 
	'nvim-telescope/telescope.nvim', tag = '0.1.5', 
	dependencies = { 'nvim-lua/plenary.nvim'},
	-- Config require().setup() calls
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
}

