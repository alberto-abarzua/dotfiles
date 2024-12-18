local lsp_zero = require("lsp-zero")


lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		vim.cmd("Telescope lsp_references")
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vri", function()
		vim.cmd("Telescope lsp_implementations")
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
        "denols",
		"rust_analyzer",
		"pyright",
		"clangd",
		"bashls",
		"dockerls",
		"yamlls",
		"jsonls",
        "typst_lsp",
		"cssls",
		"tailwindcss",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	}),
})
require("lspconfig").tailwindcss.setup({})
require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "onType", -- Choose onType, onSave or never.
        serverPath = "", -- Normally, there is no need to uncomment it.
        filetypes = {"typst","typ"},
	}
}
-- Config for Deno and TypeScript
local nvim_lsp = require('lspconfig')

local function is_deno_project(path)
  return nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "import_map.json")(path)
end

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
  filetypes = { "deno"},
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.jsdelivr.net"] = true,
          ["https://esm.sh"] = true
        }
      }
    }
  },
  single_file_support = false
}

-- Setup ts_ls (TypeScript)
nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  root_dir = function(fname)
    if is_deno_project(fname) then
      return nil
    end
    -- Default TypeScript project detection
    return nvim_lsp.util.root_pattern("package.json", "tsconfig.json")(fname)
  end,
  single_file_support = false
}
nvim_lsp.pyright.setup {
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern('pyrightconfig.json'),
    settings = {
        pyright = { autoImportCompletion = true },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            }
        }
    }
}
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
  callback = function(ev)
    if is_deno_project(ev.file) then
      vim.schedule(function()
        for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = ev.buf })) do
          if client.name == "ts_ls" then
            client.stop()
          end
        end
      end)
    end
  end,
})
vim.api.nvim_create_user_command("CheckLsp", function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    print(string.format("Active LSP: %s (root: %s)", client.name, client.config.root_dir or "none"))
  end
end, {})

vim.api.nvim_create_user_command("DenoDebug", function()
    local fname = vim.fn.expand('%:p')
    local is_deno = is_deno_project(fname)
    print("Current file:", fname)
    print("Is Deno project:", is_deno and "yes" or "no")
    
    -- Check for deno files
    local deno_files = {"deno.json", "deno.jsonc", "import_map.json"}
    for _, file in ipairs(deno_files) do
        local check_path = vim.fn.findfile(file, ".;")
        print(file .. " found at:", check_path ~= "" and check_path or "not found")
    end
    
    -- List all active clients
    print("\nActive LSP clients:")
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
        print(string.format("- %s (root: %s)", client.name, client.config.root_dir or "none"))
    end
    
    -- Check filetype
    print("\nCurrent filetype:", vim.bo.filetype)
end, {})
