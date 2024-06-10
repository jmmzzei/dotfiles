-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable <Space> key (NOP = no operation)
vim.api.nvim_set_keymap("n", " ", "<NOP>", { noremap = true })

-- change Vim navigation keys for my keyboard
vim.api.nvim_set_keymap("n", "ñ", "l", { noremap = true })
vim.api.nvim_set_keymap("n", "l", "k", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "h", { noremap = true })

vim.api.nvim_set_keymap("o", "ñ", "l", { noremap = true })
vim.api.nvim_set_keymap("o", "l", "k", { noremap = true })
vim.api.nvim_set_keymap("o", "k", "j", { noremap = true })
vim.api.nvim_set_keymap("o", "j", "h", { noremap = true })

vim.api.nvim_set_keymap("v", "ñ", "l", { noremap = true })
vim.api.nvim_set_keymap("v", "l", "k", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "j", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "h", { noremap = true })

-- Escape terminal mode quickly
vim.api.nvim_set_keymap("t", "kk", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true })

-- Escape insert mode quickly
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true })

-- Escape insert mode quickly in terminal mode
vim.api.nvim_set_keymap("t", "kk", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true })

-- change active pane
vim.api.nvim_set_keymap("n", "<s-q>", "<C-W>h", { expr = false, silent = true })
vim.api.nvim_set_keymap("n", "<s-w>", "<C-W>w", { expr = false, silent = true })

-- toggle backward cursor and record macro key
vim.api.nvim_set_keymap("n", "q", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "b", "q", { noremap = true })
vim.api.nvim_set_keymap("x", "q", "b", { noremap = true })
vim.api.nvim_set_keymap("x", "b", "q", { noremap = true })
vim.api.nvim_set_keymap("o", "q", "b", { noremap = true })
vim.api.nvim_set_keymap("o", "b", "q", { noremap = true })

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "_", ":Neotree toggle<CR>", { silent = true })

-- vim-commentary - toggle comments
vim.api.nvim_set_keymap("n", ";", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", ";", "gc", { silent = true })

-- vim-wiki toggle shortcut
vim.api.nvim_set_keymap("n", "<Leader>ww", ":vs 100 | VimwikiIndex<CR>", {})

-- telescope keymaps
local builtin = require("telescope.builtin")
local ext = require("telescope").extensions
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>e", builtin.live_grep, {})
vim.keymap.set("v", "<leader>e", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>gk", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gj", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>gbr", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gt", ext.git_file_history.git_file_history, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Rg > ") })
end)

-- vim-fugitive keymaps
vim.api.nvim_set_keymap("n", "<space>ga", ":Git add %:p<CR><CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gs", ":vertical Git<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gc", ":Git commit -v -q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gn", ":Git commit -v --amend --no-edit<CR><CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gd", ":Gdiff<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gh", ":Gclog %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>ge", ":Gedit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gr", ":Gread<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gw", ":Gwrite<CR><CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gl", ":silent! Glog<CR>:bot copen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gp", ":Ggrep<Space>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gm", ":Gmove<Space>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gb", ":Git branch<Space>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>go", ":Git checkout<Space>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gps", ":Git push<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>gpl", ":Git pull<CR>", { noremap = true })
vim.api.nvim_set_keymap("c", "blame", "Git blame", { silent = true, noremap = true })
