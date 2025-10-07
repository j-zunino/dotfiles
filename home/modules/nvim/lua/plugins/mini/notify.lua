vim.notify = require('mini.notify').make_notify()

vim.keymap.set('n', '<leader>n', ':lua MiniNotify.show_history()<CR>', {
    noremap = true,
    silent = true,
    desc = 'Show notification history',
})

local win_config = function()
    local has_statusline = vim.o.laststatus > 0
    local pad = vim.o.cmdheight + (has_statusline and 1 or 0)

    return {
        anchor = 'SE',
        col = vim.o.columns,
        row = vim.o.lines - pad,
        title = '',
        border = 'solid',
    }
end

return {
    require('mini.notify').setup({
        lsp_progress = { enable = true },
        window = {
            config = win_config,
            winblend = 0,
        },
    }),
}
