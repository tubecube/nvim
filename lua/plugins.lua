local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
	return
end

-- use {
--   'myusername/example',        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--   requiring a string which matches one of these patterns, the plugin will be loaded.
-- }

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'nvim-tree/nvim-web-devicons'

	use 'tpope/vim-repeat'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup{}
		end
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require("indent_blankline").setup({
				show_current_context = true,
				-- show_current_context_start = true,
				use_treesitter_scope = true,
				show_end_of_line = true,
			})
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		config = function ()
			require("lualine").setup {
				options = {
					theme = 'dracula',
					disabled_filetypes = {"NvimTree"},
				}
			}
		end
	}
	use {
		'akinsho/bufferline.nvim',
		config = function ()
			require("bufferline").setup {
				options = {
					numbers = "ordinal",
				}
			}

			function keymap(key, map)
				vim.api.nvim_set_keymap("n", key, map, {noremap = true})
			end

			keymap("<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
			keymap("<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
			keymap("<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")
			keymap("<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")
			keymap("<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")
			keymap("<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")
			keymap("<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>")
			keymap("<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>")
			keymap("<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>")
			keymap("<leader>-", "<cmd>BufferLineGoToBuffer -1<cr>")
			keymap("<leader>k", "<cmd>BufferLinePick<cr>")
			keymap("<leader>h", "<cmd>BufferLineCyclePrev<cr>")
			keymap("<leader>l", "<cmd>BufferLineCycleNext<cr>")
		end
	}
	use {
		'kyazdani42/nvim-tree.lua',
		config = function ()
			require'nvim-tree'.setup {
			}
			vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {noremap = true, silent = true})
			vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeFindFile<cr>", {noremap = true, silent = true})
		end
	}

	use 'psliwka/vim-smoothie'

	use {
		'Mofiqul/dracula.nvim',
		config = function()
			vim.g.dracula_transparent_bg = true
			vim.g.dracula_show_end_of_buffer = true
		end
	}

	use {
		'jiangmiao/auto-pairs',
	}
	
	use {
		'RRethy/vim-illuminate',
		config = function()
			vim.g.Illuminate_delay = 500
			vim.g.Illuminate_ftblacklist = {"NvimTree"}
		end
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
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
		end
	}

	use 'neovim/nvim-lspconfig'
	use 'ray-x/lsp_signature.nvim'

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'hrsh7th/cmp-cmdline'},
			{'ray-x/cmp-treesitter'},
			{'saadparwaiz1/cmp_luasnip'},
		}
	}

	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-live-grep-args.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim', run = "make"},
		},
		config = function()
			local telescope = require("telescope")
			function keymap(key, map)
				vim.api.nvim_set_keymap("n", key, map, {noremap = true})
			end

			keymap("<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>")
			keymap("<leader>g", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
			keymap("<leader><S-g>", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
			keymap("<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
			keymap("<leader>po", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
			keymap("<leader>pp", "<cmd>lua require('telescope.builtin').planets{}<cr>")
			keymap("<leader>pc", "<cmd>lua require('telescope.builtin').commands{}<cr>")
			keymap("<leader>ps", "<cmd>lua require('telescope.builtin').search_history{}<cr>")

			telescope.setup {
				defaults = {
					-- sorting_strategy = "ascending",
					-- layout_strategy = 'center',
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
					live_grep_args = {
						auto_quoting = true,
					},
				},
			}
		end
	}

end)
