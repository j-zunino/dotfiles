return {
    'OXY2DEV/markview.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    ft = { 'markdown', 'quarto', 'rmd', 'typst', 'Avante' },
    opts = {
        preview = {
            filetypes = {
                'md',
                'markdown',
                'norg',
                'rmd',
                'org',
                'vimwiki',
                'typst',
                'latex',
                'quarto',
                'Avante',
                'codecompanion',
            },
            ignore_buftypes = {},
            icon_provider = 'mini',
        },
    },
}
