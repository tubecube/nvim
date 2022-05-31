
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	textobjects = {
		enable = true,
	},
	indent = {
		enable = false,
	}
}

vim.api.nvim_exec([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	set foldlevel=99
]], true)
