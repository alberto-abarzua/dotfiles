local builtin = require("telescope.builtin")

-- Map <leader>ff to find_files
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

-- Map <C-p> to git_files
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

-- Map <leader>gt to grep_string with input
vim.keymap.set("n", "<leader>gt", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
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

-- Map to a key sequence
vim.api.nvim_set_keymap(
	"n",
	"<leader>ffd",
	[[<Cmd>lua find_file_and_function()<CR>]],
	{ noremap = true, silent = true }
)

-- Function to find file and then function within that file
function find_file_and_function()
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local selection = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
				require("telescope.actions").close(prompt_bufnr)
				local filename = selection.value
				vim.cmd("edit " .. filename)
				require("telescope.builtin").lsp_document_symbols()
			end)
			return true
		end,
	})
end
