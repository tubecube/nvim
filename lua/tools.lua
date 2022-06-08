local api = vim.api
local M = {}
function M.makeScratch()
	api.nvim_command('enew') -- equivalent to :enew
	vim.bo[0].buftype='nofile'
	vim.bo[0].bufhidden='hide'
	vim.bo[0].swapfile=false
end

function M.EnableWSLYank()
	local clip = "/mnt/c/Windows/System32/clip.exe"
	if vim.fn.executable(clip) then
		vim.cmd(string.format([[
			augroup WSLYank
				autocmd!
				autocmd TextYankPost * if v:event.operator ==# 'y' | call system("%s", @0) | endif
			augroup END
		]], clip))
	end
end

function M.ReturnLastPosOnEnter()
	vim.cmd([[
		autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	]])
end

function M.FixFoldBug()
	vim.cmd([[
		augroup _fold_bug_solution
			autocmd!
			autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
		augroup end
	]])
end
return M
