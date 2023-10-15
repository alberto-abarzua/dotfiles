if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end
vim.cmd([[colorscheme catppuccin-macchiato]])
vim.g.lightline = { colorscheme = "catppuccin" }
vim.g.airline_theme = "catppuccin"
