-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- Enable line and relative number
vim.wo.number = true
vim.wo.relativenumber = true

---- Window and tab navigation

-- Navigate through tabs
vim.api.nvim_set_keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabprev<CR>", { noremap = true, silent = true })

-- Move through windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Vertical split
vim.api.nvim_set_keymap("n", "<Leader>v", ":vsplit<CR>", { noremap = true, silent = true })

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
