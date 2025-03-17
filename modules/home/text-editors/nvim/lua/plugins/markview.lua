return {
    'OXY2DEV/markview.nvim',
    lazy = true,
    ft = { 'markdown', 'Avante' },
    opts = {
        preview = {
            filetypes = {
                'md',
                'markdown',
                'Avante',
            },
            ignore_buftypes = {},
            icon_provider = 'mini',
        },
    },
}
