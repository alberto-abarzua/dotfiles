-- Enable ALE and basic settings
vim.g.ale_enabled = 1
vim.g.ale_lint_on_save = 1

-- Configure ALE linters
vim.g.ale_linters = {
	["javascript"] = { "ts_ls", "eslint" },
	["typescript"] = { "ts_ls", "eslint" },
	["deno"] = { "deno" },
	["typescriptreact"] = { "ts_ls" },
	["javascriptreact"] = { "ts_ls" },
	["rust"] = { "rust_analyzer" },
	["python"] = { "pyright" },
	["c"] = { "clangd" },
	["cpp"] = { "clangd" },
	["bash"] = { "bashls" },
	["dockerfile"] = { "hadolint" },
	["yaml"] = { "yamllint" },
	["json"] = { "jsonlint" },
	["css"] = { "cssls" },
	["lua"] = { "stylua" },
}

-- Configure combined ALE fixers
vim.g.ale_fixers = {
	["javascript"] = { "prettier" },
	["typescript"] = { "prettier" },
	["typescriptreact"] = { "prettier" },
	["javascriptreact"] = { "prettier" },
	["deno"] = { "prettier" }, -- This will use deno fmt
	["rust"] = { "rustfmt" },
	["python"] = { "autopep8" },
	["c"] = { "clang-format" },
	["cpp"] = { "clang-format" },
	["bash"] = { "shfmt" },
	["yaml"] = { "prettier" },
	["json"] = { "prettier" },
	["css"] = { "prettier" },
	["lua"] = { "stylua" },
	["markdown"] = { "prettier" },
}

-- Configure Deno formatter options

-- Other settings
vim.g.ale_python_autopep8_options = "--max-line-length 120"
vim.g.ale_lint_on_text_changed = "never"
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ALEFix<CR>", { noremap = true })
vim.g.ale_disable_lsp = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_delay = 1000
vim.g.ale_javascript_prettier_use_global = 1
vim.g.ale_javascript_prettier_executable = vim.fn.system("which prettier"):gsub("\n", "")

-- Strict ts_ls linter
