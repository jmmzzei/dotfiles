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

vim.g.vimwiki_list = {
	{ path = GetNotesFolder(), syntax = "markdown", ext = ".md" },
}

vim.api.nvim_set_keymap("n", "<Leader>ww", ":vs 100 | VimwikiIndex<CR>", {})
