return {
    'yetone/avante.nvim',
    version = false,
    build = 'make',
    lazy = true,
    keys = {
        '<leader>aa',
        '<leader>ae',
        '<leader>ar',
        '<leader>af',
        '<leader>at',
        '<leader>ad',
        '<leader>ah',
        '<leader>as',
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'echasnovski/mini.icons',
        'MeanderingProgrammer/render-markdown.nvim',
    },
    opts = {
        provider = 'gemini',
        gemini = {
            model = 'gemini-2.0-flash',
            temperature = 0,
            max_tokens = 4096,
        },
        windows = {
            width = 40,
            sidebar_header = {
                align = 'left',
                rounded = false,
            },
            input = {
                prefix = ' ',
            },
            edit = {
                border = 'single',
            },
            ask = {
                floating = false,
                border = 'single',
            },
        },
        mappings = {
            sidebar = {
                close = {
                    '<C-q>',
                    '<Esc>',
                    'q',
                },
                close_from_input = {
                    normal = { '<C-q>', '<Esc>', 'q' },
                    insert = { '<C-q>' },
                },
            },
        },
    },
}
