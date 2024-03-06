-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Always use vertical diffs
vim.opt.diffopt:append("vertical")

-- Open vertical splits on the right
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false

