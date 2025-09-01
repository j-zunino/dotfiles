return {
    require('mini.diff').setup({
        delay = { text_change = 100 },
        view = {
            style = 'sign',
            signs = { add = '│', change = '┊', delete = '─' },
            -- signs = { add = '┃', change = '┇', delete = '󱘹' },
        },
    }),

    vim.keymap.set('n', '<leader>Td', function()
        require('mini.diff').toggle_overlay(0)
    end, { desc = 'Toggle diff', noremap = true, silent = true }),
}
