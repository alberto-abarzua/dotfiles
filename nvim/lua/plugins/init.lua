require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.3",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			return require("plugins.configs.telescope")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			return require("plugins.configs.catppuccin")
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		config = function()
			return require("plugins.configs.diffview")
		end,
	},
	{
		"itchyny/lightline.vim",
		lazy = false,
		config = function()
			vim.g.lightline = { colorscheme = "catppuccin" }
			vim.g.airline_theme = "catppuccin"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			return require("plugins.configs.treesitter")
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"mbbill/undotree",
		config = function()
			return require("plugins.configs.undotree")
		end,
	},
	{ "tpope/vim-surround" },
	{
		"ggandor/leap.nvim",
		config = function()
			return require("plugins.configs.leap")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			return require("plugins.configs.lsp")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			return require("plugins.configs.cmp")
		end,
	},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	-- {
	--     "VonHeikemen/lsp-zero.nvim",
	--     lazy = false,
	--     branch = "v3.x",
	--     config = function()
	--         return require("plugins.configs.lsp")
	--     end,
	--     dependencies = {
	--         -- LSP Support
	--         -- Autocompletion
	--     }
	-- },

	{
		"L3MON4D3/LuaSnip",
		config = function()
			local ls = require("luasnip")

			-- Load friendly-snippets
			require("luasnip.loaders.from_vscode").load()

			-- Load custom snippets from lua/snippets directory
			require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/snippets/" })

			-- Enable snippet expansion
			ls.setup({
				history = true,
				update_events = { "TextChanged", "TextChangedI" },
				enable_autosnippets = true,
				ext_opts = {
					[require("luasnip.util.types").choiceNode] = {
						active = {
							virt_text = { { "●", "GruvboxOrange" } },
						},
					},
				},
			})

			-- Direct snippet expansion keymap
			vim.keymap.set({ "i" }, "<C-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })

			-- Tab for snippet navigation
			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end, { silent = true })

			-- Shift-Tab to jump backwards
			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
				end
			end, { silent = true })
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			return require("plugins.configs.copilot")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			return require("plugins.configs.nvimtree")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			return require("plugins.configs.comment")
		end,
	},
	{
		"dense-analysis/ale",
		config = function()
			return require("plugins.configs.ale")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		config = function()
			return require("plugins.configs.tmuxnav")
		end,
	},
})
