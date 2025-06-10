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
    },
    opts = {
        mode = 'agentic',
        provider = 'gemini',
        providers = {
            gemini = {
                model = 'gemini-2.0-flash',
            },
        },
        windows = {
            width = 45,
            wrap = false,
            sidebar_header = {
                align = 'center',
                rounded = false,
            },
            input = {
                prefix = ' ',
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
