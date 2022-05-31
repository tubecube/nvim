local telescope = require("telescope")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>", opts)
keymap("n", "<leader><S-g>", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>m", "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", opts)

telescope.setup {
	defaults = {
		sorting_strategy = "ascending",
		layout_strategy = 'center',
	},
	pickers = {
		find_files = {
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {

			}
		},
		live_grep_raw = {
			auto_quoting = true,
		},
		frecency = {
			show_scores = false,
			workspaces = {
				["vim"] = "/Users/gaosiyuan/.config/nvim",
			}
		}
	},
}

telescope.load_extension("live_grep_raw")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("frecency")
