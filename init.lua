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
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

-- set list
-- vim.opt.listchars:append("eol:↴")

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "j", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true })
keymap("", "k", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true })
keymap("n", "<leader>w", "<cmd>w<cr>", { noremap = true })
keymap("n", "<leader>q", "<cmd>qa<cr>", { noremap = true })
keymap("", "<leader><cr>", ":nohl<cr>", { noremap = true, silent = true })

-- Buffer move
-- keymap("", "<leader>l", ":bnext<cr>", {})
-- keymap("", "<leader>h", ":bprev<cr>", {})
-- keymap("", "<leader>j", ":b#<cr>", {})

-- Return to last edit position when opening files (You want this!)
vim.cmd [[
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

-- Close current buffer
keymap("", "<leader>d", ":bdelete!<cr>", { noremap = true })

require("plugins")
require("conf")
vim.cmd([[
	set background=dark
	colorscheme edge
]])
