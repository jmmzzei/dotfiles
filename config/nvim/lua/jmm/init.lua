require("jmm.remap")
require("jmm.set")

-- VIMWIKI Config
-- Must be placed here because of this: https://github.com/vimwiki/vimwiki/issues/1130#issuecomment-1373515122
local function isOnSomeParticularMachine(hostname)
	local f = io.popen("hostname")
	local myhostname = f:read("*a"):gsub("\n", "")
	f:close()
	return myhostname == hostname
end

function GetNotesFolder()
	if isOnSomeParticularMachine("jmm-pc") then
		return "~/Documents/notes"
	else
		return "~/Documentos/notes"
	end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.g.vimwiki_list = {
	{ path = GetNotesFolder(), syntax = "markdown", ext = ".md" },
}

vim.api.nvim_set_keymap("n", "<Leader>ww", ":vs 100 | VimwikiIndex<CR>", {})
