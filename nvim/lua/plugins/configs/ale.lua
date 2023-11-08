-- Enable ALE
vim.g.ale_enabled = 1

-- Set ALE to run on save
vim.g.ale_lint_on_save = 1

-- Use LSP for linting and formatting
vim.g.ale_linters = {
	["javascript"] = { "tsserver" },
	["typescript"] = { "tsserver" },
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

vim.g.ale_fixers = {
	["javascript"] = { "prettier" },
	["typescript"] = { "prettier" },
	["typescriptreact"] = { "prettier" },
	["javascriptreact"] = { "prettier" },
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
-- Make autopep8 use 120 characters per line
vim.g.ale_python_autopep8_options = "--max-line-length 120"

-- Optional: Use ALE with specific file types
vim.g.ale_lint_on_text_changed = "never" -- Disable linting as you type
vim.g.ale_fix_on_save = 1 -- Automatically fix on save

-- Ensure ALE doesn't conflict with your other plugins
vim.g.ale_disable_lsp = 1

-- Additional ALE configuration can be added here as needed

-- Finally, add your language servers from lsp-zero
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_delay = 1000
