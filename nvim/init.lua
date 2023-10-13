-- Bootstrap Packer
require("bootstrap")

-- Load Plugins
require("plugins")

-- Load Colors
require("colors")

-- Load Mappings
require("mappings")

-- Load Settings
require("settings")

require("lspconfig").clangd.setup({
	-- cmd = { "clangd", "--background-index", "--log=error" },
	-- inti_options = {
	-- 	fallbackFlags = { "-std=c++20", "-stdlib=libc++" },
	-- },
})
vim.lsp.set_log_level("trace")
