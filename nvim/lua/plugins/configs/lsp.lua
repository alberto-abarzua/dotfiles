-- ───── Mason ────────────────────────────────────────────────────────────────
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		-- Typescript
		"ts_ls", -- <— new server name
		"denols",

		-- General-purpose
		"rust_analyzer",
		"pyright",
		"clangd",
		"bashls",
		"dockerls",
		"yamlls",
		"jsonls",
		"cssls",
		"tailwindcss",
		"emmet_ls",
		"tinymist",
		"lua_ls",
	},
})

-- ───── nvim-cmp ─────────────────────────────────────────────────────────────
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = { { name = "path" }, { name = "nvim_lsp" }, { name = "nvim_lua" } },
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	}),
})

-- ───── Utility commands ----------------------------------------------------
vim.api.nvim_create_user_command("CheckLsp", function()
	for _, c in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
		print(string.format("• %s (root: %s)", c.name, c.config.root_dir or "nil"))
	end
end, {})

vim.api.nvim_create_user_command("DenoDebug", function()
	local file = vim.fn.expand("%:p")
	print("Current file :", file)
	print("Is Deno proj :", is_deno(file) and "yes" or "no")

	for _, f in ipairs({ "deno.json", "deno.jsonc", "import_map.json" }) do
		local p = vim.fn.findfile(f, ".;")
		print(string.format("  %s -> %s", f, p ~= "" and p or "not found"))
	end

	print("\nActive LSP clients:")
	for _, c in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
		print(string.format("• %s (root: %s)", c.name, c.config.root_dir or "nil"))
	end
end, {})

-- MDX filetype ----------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.mdx",
	command = "set filetype=markdown.mdx",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.bo[args.buf].formatexpr = nil
		-- Unset 'omnifunc'
		vim.bo[args.buf].omnifunc = nil

		vim.keymap.set("n", "<C-Space>", "<C-x><C-o>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

		vim.keymap.set("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		-- rename
		vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float, opts)
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("denols")

vim.lsp.config("denols", {
	root_markers = { "deno.json" },
	workspace_required = true,
})

-- ts_ls.lua
vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = { "package.json" },
	workspace_required = true,
	-- and some other stuff
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
})

vim.api.nvim_set_hl(0, "LspCodeLens", {
	fg = "#bbbbbb", -- your choice of text color
	bg = "#2e2e2e", -- solid background
	italic = true, -- optional
})
-- (If you’re using the new `vim.lsp.inlay_hint()` API, it uses LspInlayHint:)
vim.api.nvim_set_hl(0, "LspInlayHint", {
	fg = "#8fbcbb",
	bg = "#2e2e2e",
	italic = true,
})

-- 2) Tweak signature-help’s floating window so it’s opaquer, has a border, etc.
--    This replaces the default handler for “textDocument/signatureHelp”.
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded", -- single, double, rounded, etc.
	winblend = 0, -- 0 = fully opaque
	focusable = false, -- don’t steal focus
	-- you can also add `offset_y = -1` for a little padding above/below
})
-- and then color the float’s background / border:
vim.api.nvim_set_hl(0, "LspSignatureHelpBorder", { fg = "#5e81ac", bg = "#2e3440" })
vim.api.nvim_set_hl(0, "LspSignatureHelpFloating", { bg = "#2e3440" })

-- 3) Show lint warnings inline at end-of-line (virtual text) and disable the
--    little “E”/“W” signs in the signcolumn
vim.diagnostic.config({
	-- turn OFF the gutter signs entirely:
	signs = false,
	-- but turn ON virtual_text, with a custom format
	virtual_text = {
		spacing = 4, -- space between code and message
		prefix = "▶", -- or “●”, “❯”, whatever you like
		format = function(diagnostic)
			-- include source & code so you get more context:
			local src = diagnostic.source or "LSP"
			local code = diagnostic.code and ("[" .. diagnostic.code .. "]") or ""
			return string.format("%s %s %s", diagnostic.message, src, code)
		end,
	},
	underline = true,
	update_in_insert = false, -- don’t update while typing
})

-- 1) Override the hover handler to give it a border, padding, etc.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- try "single", "double", "shadow", etc
	winblend = 0, -- 0 = fully opaque
	focusable = false, -- don’t steal focus
	-- you can even constrain its size:
	max_width = 80,
	max_height = 20,
	-- override which highlight groups the float uses:
	--   NormalFloat → your window background/text
	--   FloatBorder  → your border color
	winhighlight = "NormalFloat:LspHoverNormal,FloatBorder:LspHoverBorder",
})

-- 2) Define your own float highlight groups
vim.api.nvim_set_hl(0, "LspHoverNormal", {
	bg = "#2e3440", -- your solid background
	fg = "#d8dee9", -- your text color
})
vim.api.nvim_set_hl(0, "LspHoverBorder", {
	bg = "#2e3440", -- match bg so border looks connected
	fg = "#81a1c1", -- border color
})
-- a helper to (re)apply your colors after any colorscheme
-- stash the original
local _open = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts)
	opts = opts or {}
	-- default to rounded border
	opts.border = opts.border or "rounded"
	-- make sure the float uses *our* NormalFloat/FloatBorder groups
	opts.winhighlight = opts.winhighlight or "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
	-- optional padding (Neovim 0.11+)
	opts.pad_left = opts.pad_left or 1
	opts.pad_right = opts.pad_right or 1
	opts.pad_top = opts.pad_top or 1
	opts.pad_bottom = opts.pad_bottom or 1

	return _open(contents, syntax, opts)
end
