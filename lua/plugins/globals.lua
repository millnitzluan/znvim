local api = vim.api
local fn = vim.fn

_G.I = vim.inspect
_G.fmt = string.format
_G.logger = require("plugins.logger")

-- [ global variables ] --------------------------------------------------------

vim.g.os = vim.loop.os_uname().sysname
vim.g.is_macos = vim.g.os == "Darwin"

vim.g.open_command = vim.g.is_macos and "open" or "xdg-open"

vim.g.packer_compiled_path = fmt("%s/plugin/packer_compiled.lua", vim.fn.stdpath("config")) -- alts: fmt("%s/packer/packer_compiled.lua", vim.fn.stdpath("cache"))
vim.g.packer_install_path = fmt("%s/site/pack/packer/%s/packer.nvim", fn.stdpath("data"), "opt")
vim.g.packer_snapshot_path = fmt("%s/packer/snapshots/", vim.fn.stdpath("cache"))

vim.g.home = os.getenv("HOME")
vim.g.vim_path = fmt("%s/.config/nvim", vim.g.home)
vim.g.cache_path = fmt("%s/.cache/nvim", vim.g.home)
vim.g.local_state_path = fmt("%s/.local/state/nvim", vim.g.home)
vim.g.local_share_path = fmt("%s/.local/share/nvim", vim.g.home)

-- [ runtimepath (rtp) ] -------------------------------------------------------

vim.opt.runtimepath:remove("~/.cache")
vim.opt.runtimepath:remove("~/.local/share/src")

-- [ utils ] -------------------------------------------------------------------

---Require a module using `pcall` and report any errors
---@param module string | table
---@param opts table?
---@return boolean, any
function mega.require(module, opts)
	-- local function pc(func, ...)
	--   local args = { ... }
	--   return xpcall(func and function() return func(unpack(args)) end, function(err)
	--     if err:find("DevIcon") or err:find("mason") or err:find("Invalid highlight") then return err end
	--     vim.api.nvim_echo({ { err, "ErrorMsg" }, { debug.traceback("", 3), "Normal" } }, true, {})
	--     return err
	--   end)
	-- end

	opts = opts or { silent = true }
	local ok, result = pcall(require, module)
	if not ok and not opts.silent then
		if opts.message then
			result = opts.message .. "\n" .. result
		end
		vim.notify(result, vim.log.levels.ERROR, { title = fmt("Error requiring: %s", module) })
	end
	return ok, result
end

local installed
---
--#region

function mega.empty(item)
	if not item then
		return true
	end
	local item_type = type(item)
	if item_type == "string" then
		return item == ""
	elseif item_type == "number" then
		return item <= 0
	elseif item_type == "table" then
		return vim.tbl_isempty(item)
	end
end

function mega.fold(callback, list, accum)
	for k, v in pairs(list) do
		accum = callback(accum, v, k)
		assert(accum ~= nil, "The accumulator must be returned on each iteration")
	end
	return accum
end

local function validate_autocmd(name, cmd)
	local keys = { "event", "buffer", "pattern", "desc", "command", "group", "once", "nested" }
	local incorrect = mega.fold(function(accum, _, key)
		if not vim.tbl_contains(keys, key) then
			table.insert(accum, key)
		end
		return accum
	end, cmd, {})
	if #incorrect == 0 then
		return
	end
	vim.schedule(function()
		vim.notify("Incorrect keys: " .. table.concat(incorrect, ", "), vim.log.levels.ERROR, {
			title = fmt("Autocmd: %s", name),
		})
	end)
end

function mega.augroup(name, commands)
	assert(name ~= "User", "The name of an augroup CANNOT be User")

	local id = vim.api.nvim_create_augroup(name, { clear = true })

	for _, autocmd in ipairs(commands) do
		validate_autocmd(name, autocmd)
		local is_callback = type(autocmd.command) == "function"
		api.nvim_create_autocmd(autocmd.event, {
			group = id,
			pattern = autocmd.pattern,
			desc = autocmd.desc,
			callback = is_callback and autocmd.command or nil,
			command = not is_callback and autocmd.command or nil,
			once = autocmd.once,
			nested = autocmd.nested,
			buffer = autocmd.buffer,
		})
	end

	return id
end

return mega
