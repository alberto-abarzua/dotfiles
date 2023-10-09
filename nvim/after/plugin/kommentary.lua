
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

vim.api.nvim_set_keymap('v', '<Leader>/', '<Plug>kommentary_visual_default', { noremap = false, silent = true })

