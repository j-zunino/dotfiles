return {
    'OXY2DEV/markview.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        preview = {
            icon_provider = 'mini',
        },
    },
}
