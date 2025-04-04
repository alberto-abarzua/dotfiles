local M = {}

-- Global variable to track diffview state
_G.diffview_is_open = false

function M.setup()
    -- Set up key mapping for DiffviewOpen/Close toggle
    vim.keymap.set('n', '<leader>kk', function()
        if _G.diffview_is_open then
            vim.cmd('DiffviewClose')
            _G.diffview_is_open = false
        else
            vim.cmd('DiffviewOpen')
            _G.diffview_is_open = true
        end
    end, { noremap = true, silent = true, desc = "Toggle Diffview" })
    
    -- Set up autocmd to update state when diffview is closed by other means
    vim.api.nvim_create_autocmd("WinClosed", {
        callback = function(ev)
            local buf = vim.api.nvim_win_get_buf(tonumber(ev.match))
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if buf_name:match("DiffviewFiles") then
                _G.diffview_is_open = false
            end
        end,
    })
end

return M.setup()
