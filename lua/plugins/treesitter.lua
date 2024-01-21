-- Treesitter
-- AST parser or syntax parser, to enable syntax highlighting and LSP
return { 
	"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
	config = function()
	local configure = require("nvim-treesitter.configs")
	configure.setup({
		ensure_installed = {"lua", "javascript", "c", "cmake", "typescript", "vim", "html", "go", "python", "markdown", "json", "dockerfile", "make", "yaml"},
		highlight = { enable = true },
		indent = { enable = true },
	})
	end
}

