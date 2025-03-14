return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
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
    version = false,
    opts = {
        provider = 'gemini',
        gemini = {
            model = 'gemini-1.5-flash-latest',
            temperature = 0,
            max_tokens = 4096,
        },
        windows = {
            width = 40,
            sidebar_header = {
                align = 'left',
                rounded = false,
            },
            edit = {
                border = 'single',
            },
            ask = {
                floating = false,
                border = 'single',
            },
        },
    },
    build = 'make',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        -- 'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        --- The below dependencies are optional,
        'hrsh7th/nvim-cmp',
        'ibhagwan/fzf-lua',
        'echasnovski/mini.icons',
    },
}
