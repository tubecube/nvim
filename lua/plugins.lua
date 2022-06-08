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
	use {
		'lewis6991/impatient.nvim',
		config = function()
			require'impatient'
		end
	}

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'tpope/vim-repeat'
	use 'tpope/vim-surround'

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup{}
		end
	}

	use {
		'rcarriga/nvim-notify',
		config = function ()
			vim.notify = require('notify')
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
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use {
		'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons'},
	}

	use {
		'goolord/alpha-nvim',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}
	use 'akinsho/toggleterm.nvim'

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {

			}
		end
	}

	-- comment
	use 'b3nj5m1n/kommentary'

	-- colorschemes
	use 'sainnhe/sonokai'
	use {
		'sainnhe/edge',
		config = function()
			vim.g.edge_style = 'default'
			vim.g.edge_better_performance = 1
		end
	}
	use {
		'folke/tokyonight.nvim',
		config = function()
			vim.g.tokyonight_style = 'night' -- day or storm
		end
	}
	use 'Mofiqul/dracula.nvim'

	use 'jiangmiao/auto-pairs'
	use 'RRethy/vim-illuminate'

	-- treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

	--lsp
	use 'neovim/nvim-lspconfig'
	use 'ray-x/lsp_signature.nvim'
	-- use 'kosayoda/nvim-lightbulb' -- code action

	use {
		"j-hui/fidget.nvim",
		config = function ()
			require 'fidget'.setup{}
		end
	}

	--cmp plugins
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

	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	-- telescope
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{'nvim-lua/plenary.nvim'},
		}
	}

	use {
		'nvim-telescope/telescope-live-grep-args.nvim',
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = "make"
	}

	use {
		'nvim-telescope/telescope-ui-select.nvim',
	}

	use {
		'nvim-telescope/telescope-frecency.nvim',
		requires = {'tami5/sqlite.lua'}
	}

	-- dap
	use 'mfussenegger/nvim-dap'

end)
