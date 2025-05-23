local builtin = require("telescope.builtin")

-- Map <leader>ff to find_files
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

-- Map <C-p> to git_files
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

-- Map <leader>gt to grep_string with input
vim.keymap.set("n", "<leader>gt", function()
	builtin.live_grep({ default_text = vim.fn.input("Grep > ") })
end, {})

-- Map <leader>vh to help_tags
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

-- Map <leader>fd
vim.api.nvim_set_keymap(
	"n",
	"<leader>fd",
	[[<Cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>]],
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>rr", function()
	require("telescope.builtin").lsp_workspace_symbols({
		query = vim.fn.input("Workspace Symbol > "),
	})
end, { noremap = true, silent = true })
