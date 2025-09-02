vim.notify = require('mini.notify').make_notify()

vim.keymap.set('n', '<leader>n', ':lua MiniNotify.show_history()<CR>', {
    noremap = true,
    silent = true,
    desc = 'Show notification history',
})

return {
    require('mini.notify').setup({
        lsp_progress = { enable = true },
        window = { winblend = 0 },
    }),
}
