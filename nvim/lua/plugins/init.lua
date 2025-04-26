require("lazy").setup(
    {
        {
            "nvim-telescope/telescope.nvim",
            lazy = false,
            tag = "0.1.3",
            dependencies = {{"nvim-lua/plenary.nvim"}},
            config = function()
                return require("plugins.configs.telescope")
            end
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            lazy = false,
            config = function()
                return require("plugins.configs.catppuccin")
            end
        },
        {
            "sindrets/diffview.nvim",
            lazy = false,
            config = function()
                return require("plugins.configs.diffview")
            end
        },
        {
            "itchyny/lightline.vim",
            lazy = false,
            config = function()
                vim.g.lightline = {colorscheme = "catppuccin"}
                vim.g.airline_theme = "catppuccin"
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
            build = ":TSUpdate",
            config = function()
                return require("plugins.configs.treesitter")
            end
        },
        {"windwp/nvim-ts-autotag"},
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {}
        },
        {
            "mbbill/undotree",
            config = function()
                return require("plugins.configs.undotree")
            end
        },
        {"tpope/vim-surround"},
        {
            "ggandor/leap.nvim",
            config = function()
                return require("plugins.configs.leap")
            end
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
                {"neovim/nvim-lspconfig"},
                {"williamboman/mason.nvim"},
                {"williamboman/mason-lspconfig.nvim"},
                -- Autocompletion
                {
                    "hrsh7th/nvim-cmp",
                    config = function()
                        return require("plugins.configs.cmp")
                    end
                },
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-path"},
                {"saadparwaiz1/cmp_luasnip"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-nvim-lua"},
                {
                    "roobert/tailwindcss-colorizer-cmp.nvim",
                    config = function()
                        require("tailwindcss-colorizer-cmp").setup(
                            {
                                color_square_width = 2
                            }
                        )
                    end
                },
                -- Snippets /plugins/init.lua
                {
                    "L3MON4D3/LuaSnip",
                    config = function()
                        local ls = require("luasnip")

                        -- Load friendly-snippets
                        require("luasnip.loaders.from_vscode").load()
                        -- this toally exists why am i gettting error saying module not found ai!
                        require( vim.fn.stdpath("config") .. "/lua/snippets/all.lua")
                        -- require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath("config") .. "lua/snippets/"})

                        -- -- Our keymaps: <Tab> to expand or jump, <S-Tab> to jump backwards
                        -- vim.keymap.set({ "i", "s" }, "<Tab>", function()
                        --   return ls.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump"
                        --     or "<Tab>"
                        -- end, { expr = true, silent = true })
                        -- vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
                        --   return ls.jumpable(-1) and "<Plug>luasnip-jump-prev"
                        --     or "<S-Tab>"
                        --
                    end
                },
                {"rafamadriz/friendly-snippets"}
            }
        },
        {
            "github/copilot.vim",
            lazy = false,
            config = function()
                return require("plugins.configs.copilot")
            end
        },
        {
            "kyazdani42/nvim-tree.lua",
            dependencies = {"kyazdani42/nvim-web-devicons"},
            config = function()
                return require("plugins.configs.nvimtree")
            end
        },
        {
            "numToStr/Comment.nvim",
            config = function()
                return require("plugins.configs.comment")
            end
        },
        {
            "dense-analysis/ale",
            config = function()
                return require("plugins.configs.ale")
            end
        },
        {
            "christoomey/vim-tmux-navigator",
            lazy = false,
            config = function()
                return require("plugins.configs.tmuxnav")
            end
        }
    }
)
