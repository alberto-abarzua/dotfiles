-- disable netrw
vim.defer_fn(function()
    
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrw = 1
    -- Enable line and relative number
    vim.wo.number = true
    vim.wo.relativenumber = true

    -- Indentation
    vim.o.smartindent = true
    vim.o.autoindent = true
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true

    -- Cursor settings
    vim.o.scrolloff = 8

    -- Clipboard
    vim.o.clipboard = "unnamedplus"

    -- General
    vim.o.autoread = true
    vim.o.incsearch = true
    vim.o.ignorecase = true

    vim.opt.wrap = true        -- Enable line wrapping
    vim.opt.linebreak = true   -- Wrap lines at word boundaries

    vim.opt.breakindent = true -- Preserve indentation in wrapped lines
    vim.o.hlsearch = true

    -- Indent and stay in visual mode
    vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

end, 0)

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.typ",
    callback = function()
        vim.bo.filetype = "typst"
    end,
    })
