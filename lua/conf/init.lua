M = {}

local ends_with = require("utils").ends_with


M.setup = function()
	local config_dir = vim.fn.stdpath('config') .. '/lua/conf'

	local ignores = {
		"init",
		"nvim-lightbulb",
	}

	local _ignores = {}
	for _, v in pairs(ignores) do
		_ignores[v] = true
	end

	for _, fname in pairs(vim.fn.readdir(config_dir)) do
		if ends_with(fname, ".lua") then
			local cut_suffix_fname = fname:sub(1, #fname - #'.lua')
			if _ignores[cut_suffix_fname] == nil then
				local file = "conf." .. cut_suffix_fname
				local ok, _ = pcall(require, file)
				if not ok then
					vim.notify('Failed loading ' .. fname, vim.log.levels.ERROR)
				end
			end
		end
	end
end

M.setup()
