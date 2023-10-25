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
	["dockerfile"] = { "dockerls" },
	["yaml"] = { "yamlls" },
	["json"] = { "jsonls" },
	["css"] = { "cssls" },
	["lua"] = { "stylua" },
}

vim.g.ale_fixers = {
	["javascript"] = { "prettier" },
	["typescript"] = { "prettier" },
	["typescriptreact"] = { "prettier" },
	["javascriptreact"] = { "prettier" },
	["rust"] = { "rustfmt" }, -- Assuming 'rustfmt' is the formatter for Rust
	["python"] = { "autopep8" }, -- Assuming 'autopep8' is the formatter for Python
	["c"] = { "clang-format" }, -- Assuming 'clang-format' is the formatter for C
	["cpp"] = { "clang-format" }, -- Assuming 'clang-format' is the formatter for C++
	["bash"] = { "shfmt" }, -- Assuming 'shfmt' is the formatter for Bash
	["dockerfile"] = { "dockerfilelint" }, -- Assuming 'dockerfilelint' is the formatter for Dockerfile
	["yaml"] = { "prettier" }, -- Assuming 'prettier' is the formatter for YAML
	["json"] = { "prettier" }, -- Assuming 'prettier' is the formatter for JSON
	["css"] = { "prettier" }, -- Assuming 'prettier' is the formatter for CSS
	["lua"] = { "stylua" }, -- Assuming 'stylua' is the formatter for Lua
}
-- Make autopep8 use 120 characters per line
vim.g.ale_python_autopep8_options = "--max-line-length 120"
-- Make ale use prettier global for formatting

vim.g.ale_javascript_prettier_executable = "prettier"
vim.g.ale_typescript_prettier_executable = "prettier"
vim.g.ale_typescriptreact_prettier_executable = "prettier"
vim.g.ale_javascriptreact_prettier_executable = "prettier"

-- Optional: Use ALE with specific file types
vim.g.ale_lint_on_text_changed = "never" -- Disable linting as you type
vim.g.ale_fix_on_save = 1 -- Automatically fix on save

-- Ensure ALE doesn't conflict with your other plugins
vim.g.ale_disable_lsp = 1

-- Additional ALE configuration can be added here as needed

-- Finally, add your language servers from lsp-zero
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_delay = 1000
