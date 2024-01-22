-- Telescope
-- Fuzzy finder for files 
return	{ 
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5', 
		dependencies = { 'nvim-lua/plenary.nvim'},
		-- Config require().setup() calls
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- add ui-select to our telescope plugin
			-- enable addition ui hover for our code actions
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown{}
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	}
}

