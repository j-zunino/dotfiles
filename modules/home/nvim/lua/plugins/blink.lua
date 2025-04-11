return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'saghen/blink.compat',
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        {
            'saghen/blink.compat',
            version = '*',
            lazy = true,
            opts = {},
        },
    },
    version = '1.*',
    event = 'InsertEnter',
    opts_extend = {
        'sources.default',
    },
    opts = {
        keymap = {
            preset = 'super-tab',
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'mono',
        },

        snippets = { preset = 'luasnip' },

        sources = {
            default = {
                'lazydev',
                'lsp',
                'path',
                'snippets',
                'buffer',

                'avante_commands',
                'avante_mentions',
                'avante_files',
            },

            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                },

                avante_commands = {
                    name = 'avante_commands',
                    module = 'blink.compat.source',
                    score_offset = 90,
                    opts = {},
                    enabled = function()
                        return vim.bo.filetype == 'avante'
                    end,
                },
                avante_files = {
                    name = 'avante_files',
                    module = 'blink.compat.source',
                    score_offset = 100,
                    opts = {},
                    enabled = function()
                        return vim.bo.filetype == 'avante'
                    end,
                },
                avante_mentions = {
                    name = 'avante_mentions',
                    module = 'blink.compat.source',
                    score_offset = 1000,
                    opts = {},
                    enabled = function()
                        return vim.bo.filetype == 'avante'
                    end,
                },
            },
        },

        signature = {
            enabled = true,
            window = {
                winblend = 0,
            },
        },

        completion = {
            ghost_text = {
                enabled = true,
            },

            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },

            documentation = {
                auto_show = true,
                window = {
                    winblend = 0,
                },
            },

            menu = {
                min_width = 20,
                scrollbar = true,
                draw = {
                    align_to = 'cursor',
                    columns = {
                        { 'label', 'label_description', gap = 1 },
                        { 'kind_icon', 'kind', gap = 1 },
                    },
                },
            },
        },
    },
}
