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