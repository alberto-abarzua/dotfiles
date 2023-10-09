if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end
vim.cmd([[colorscheme onedark]])
vim.g.lightline = { colorscheme = "onedark" }
vim.g.airline_theme = "onedark"
