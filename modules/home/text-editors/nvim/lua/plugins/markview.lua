return {
    'OXY2DEV/markview.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        require('markview').setup({
            preview = {
                icon_provider = 'devicons',
            },
        })
    end,
}
