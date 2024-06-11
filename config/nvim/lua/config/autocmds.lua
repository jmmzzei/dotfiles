-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- save when buffer is left or Vim's focus is lost
vim.cmd("autocmd BufLeave,FocusLost * silent! wall")

-- more convenient way to save and exit
vim.cmd("command! -nargs=0 WQ wq")
vim.cmd("command! -nargs=0 Wq wq")
vim.cmd("command! -nargs=0 W w")
vim.cmd("command! -nargs=0 Q q")

-- Set height to 10 and enter insert mode when opening a zsh terminal
vim.cmd("au TermOpen term:/*/usr/bin/zsh startinsert")

-- Command to open a horizontally split terminal pane
vim.cmd("command! TT :10sp | term")

-- vim-eunuch
vim.cmd("cabbrev Delete Delete!")
vim.cmd("cabbrev Del Delete!")

-- autosave
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Function to open in the default browser the pull request section of bitbucket based in the repo's origin info

local function run_shell_command(cmd)
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()
	return result
end

local function get_bitbucket_remote_url()
	local remote_url = run_shell_command("git config --get remote.origin.url")
	return remote_url:gsub("%s+", "") -- Trim any whitespace
end

local function construct_pr_url(remote_url)
	local username, repo_name = remote_url:match("bitbucket%.org[:/](.-)/(.-)%.git")
	if username and repo_name then
		return string.format("https://bitbucket.org/%s/%s/pull-requests/", username, repo_name)
	else
		return nil, "Invalid Bitbucket remote URL."
	end
end

local function open_url_in_browser(url)
	local open_command
	if vim.fn.has("mac") == 1 then
		open_command = "open " .. url
	elseif vim.fn.has("unix") == 1 then
		open_command = "xdg-open " .. url
	elseif vim.fn.has("win32") == 1 then
		open_command = "start " .. url
	else
		print("Unsupported OS")
		return
	end
	os.execute(open_command)
end

local function get_pr_url()
	local remote_url = get_bitbucket_remote_url()
	if remote_url == "" then
		print("No remote URL found.")
		return
	end
	local pr_url, err = construct_pr_url(remote_url)
	if pr_url then
		open_url_in_browser(pr_url)
	else
		print(err)
	end
end

vim.api.nvim_create_user_command("PR", get_pr_url, {})
