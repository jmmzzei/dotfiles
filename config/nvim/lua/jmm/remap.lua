-- Set leader key to <Space>
vim.g.mapleader = " "

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

-- save when buffer is left or Vim's focus is lost
vim.cmd("autocmd BufLeave,FocusLost * silent! wall")

-- toggle backward cursor and record macro key
vim.api.nvim_set_keymap("n", "q", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "b", "q", { noremap = true })
vim.api.nvim_set_keymap("x", "q", "b", { noremap = true })
vim.api.nvim_set_keymap("x", "b", "q", { noremap = true })
vim.api.nvim_set_keymap("o", "q", "b", { noremap = true })
vim.api.nvim_set_keymap("o", "b", "q", { noremap = true })

-- Always use vertical diffs
vim.opt.diffopt:append("vertical")

-- more convenient way to save and exit
vim.cmd("command! -nargs=0 WQ wq")
vim.cmd("command! -nargs=0 Wq wq")
vim.cmd("command! -nargs=0 W w")
vim.cmd("command! -nargs=0 Q q")

-- Set height to 10 and enter insert mode when opening a zsh terminal
vim.cmd("au TermOpen term:/*/usr/bin/zsh startinsert")

-- Command to open a horizontally split terminal pane
vim.cmd("command! TT :10sp | term")

-- Create command-line abbreviations for "Delete" and "Del"
vim.cmd("cnoreabbrev Delete Delete!")
vim.cmd("cnoreabbrev Del Delete!")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "_", ":Neotree toggle<CR>", { silent = true })

-- toggle comments
vim.keymap.set("n", "_", ":Neotree toggle<CR>", { silent = true })

vim.api.nvim_set_keymap("n", ";", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", ";", "gc", { silent = true })
