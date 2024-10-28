return {
    'voldikss/vim-floaterm',
    lazy = true,
    keys = '<leader>T',
    cmd = {
        'FloatermPrev',
        'FloatermNext',
        'FloatermFirst',
        'FloatermLast',
        'FloatermUpdate',
        'FloatermToggle',
        'FloatermShow',
        'FloatermHide',
        'FloatermKill',
        'FloatermSend',
    },
    config = function()
        vim.keymap.set(
            'n',
            '<leader>T',
            '<cmd>FloatermToggle<CR>',
            { noremap = true, silent = true, desc = 'Toggle floating terminal' }
        )
        vim.keymap.set(
            't',
            '<leader>T',
            '<C-\\><C-n><cmd>FloatermToggle<CR>',
            { noremap = true, silent = true, desc = 'Toggle floating terminal' }
        )
        vim.keymap.set(
            't',
            '<C-q>',
            '<C-\\><C-n><cmd>FloatermKill<CR>',
            { noremap = true, silent = true, desc = 'Kill floating terminal' }
        )
        vim.keymap.set(
            't',
            '<C-q>',
            '<C-\\><C-n><cmd>FloatermKill<CR>',
            { noremap = true, silent = true, desc = 'Kill floating terminal' }
        )

        -- [ settings ]
        vim.g.floaterm_width = 0.7
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_autoclose = 2
        vim.g.floaterm_title = 'Terminal'
        vim.g.floaterm_titleposition = 'center'
        vim.g.floaterm_wintype = 'float'
        vim.g.floaterm_position = 'center'
    end,
}
