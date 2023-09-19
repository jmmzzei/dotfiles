vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

-- Always use vertical diffs
vim.opt.diffopt:append("vertical")

-- Update a buffer's contents on focus if it changed outside of Vim
vim.cmd("au FocusGained,BufEnter * :checktime")

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Open vertical splits on the right
vim.opt.splitright = true
vim.opt.splitbelow = true
