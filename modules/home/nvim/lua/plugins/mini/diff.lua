return {
    require('mini.diff').setup({
        delay = { text_change = 100 },
        view = {
            style = 'sign',
            signs = { add = '│', change = '┊', delete = '─' },
            -- signs = { add = '┃', change = '┇', delete = '󱘹' },
        },
    }),
}
