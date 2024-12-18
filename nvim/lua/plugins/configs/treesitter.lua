require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "vimdoc", "javascript", "c", "lua", "cpp", "python", "html", "css","typescript","javascript","tsx","graphql", "mdx" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	auto_install = true,
    indent = {
        enable = true
    },
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		-- Modified this to false to prevent duplicate highlighting
		additional_vim_regex_highlighting = false,
        custom_captures = {
              ["graphql"] = "TSXGraphQL", -- Highlight GraphQL inside TSX
        },
	},

})


vim.treesitter.language.register("typescript","deno")

