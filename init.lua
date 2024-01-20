-- Set map leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Require local configs
-- lua/settings.lua
require('settings') 

-- Install Plugins
-- Define plugins list
local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 
		'nvim-telescope/telescope.nvim', tag = '0.1.5', 
		dependencies = { 'nvim-lua/plenary.nvim'}
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts) 

-- Running the Plugins
-- Theme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope 
-- A fuzzy finder for files
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter 
-- AST parser or syntax parser, to enable syntax highlighting and LSP
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "javascript", "html", "go", "python"},
	highlight = { enable = true },
	indent = { enable = true },
})