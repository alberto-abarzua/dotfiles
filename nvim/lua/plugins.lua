require("lazy").setup({

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{ "catppuccin/nvim", name = "catppuccin", lazy = false },

	{ "itchyny/lightline.vim", lazy = false },

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
	},

	{ "windwp/nvim-ts-autotag" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{ "mbbill/undotree" },

	{ "tpope/vim-surround" },

	{ "ggandor/leap.nvim" },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
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

	{ "github/copilot.vim", lazy = false },

	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		opts = {},
	},

	{ "numToStr/Comment.nvim" },

	{ "dense-analysis/ale" },

	{ "christoomey/vim-tmux-navigator", lazy = false },
})
