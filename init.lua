local options = {
	number = true,
	scrolloff = 3,
	tabstop = 4,
	shiftwidth = 4,
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	showmatch = true,
	autoindent = true,
	smartindent = true,
	wrap = true,
	undofile = true,
	signcolumn = "number",
	termguicolors = true,
	foldmethod = "expr",
	foldexpr = 'nvim_treesitter#foldexpr()',
	foldlevel = 99,
	splitright = true,
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

-- set list
-- vim.opt.listchars:append("eol:↴")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")
require("conf")
local tools = require("tools")
tools.EnableWSLYank()
tools.ReturnLastPosOnEnter()
tools.FixFoldBug()

local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true })
keymap("", "<leader><cr>", ":nohl<cr>", { noremap = true, silent = true })
keymap("", "<leader>j", ":b#<cr>", {silent = true, noremap = true})
keymap("", "<leader>d", ":bdelete!<cr>", { noremap = true })
keymap("", "<leader>a", ":lua require'tools'.CleanExtraSpaces()<cr>", {noremap = true, silent = true})

-- colorscheme
vim.cmd([[
	colorscheme dracula
]])
