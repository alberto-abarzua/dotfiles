vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabprev<CR>", { noremap = true, silent = true })

-- Vertical split
vim.api.nvim_set_keymap("n", "<Leader>v", ":vsplit<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Esc>", [[<Cmd>noh<CR><Esc>]], { noremap = true, silent = true })
