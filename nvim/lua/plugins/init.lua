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
		"VonHeikemen/lsp-zero.nvim",
		lazy = false,
		branch = "v3.x",
		config = function()
			return require("plugins.configs.lsp")
		end,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

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
