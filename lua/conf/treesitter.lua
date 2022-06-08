
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_decremental = "<c-p>",
			node_incremental = "<c-n>",
		}
	},
	textobjects = {
		enable = true,
	},
	indent = {
		enable = false,
	}
}
