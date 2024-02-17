local wo = vim.wo
local bo = vim.bo

-- SETTINGS
-- line numbers
vim.wo.number = true
-- highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- case-insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- sync clipboard between OS and Nvim
vim.o.clipboard = 'unnamedplus'

-- enable mouse
vim.o.mouse = 'a'

vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- ensure 8 lines at bottom
vim.opt.scrolloff = 8
-- :help vim.highlight.on_yank()
local highlight_group = vim.api.nvim_create_augroup('YankHighLight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end, 
	group = highlight_group,
	pattern = '*',
})
