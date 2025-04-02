return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'saghen/blink.compat',
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
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
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },

            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
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
            documentation = {
                auto_show = true,
                window = {
                    winblend = 0,
                },
            },

            ghost_text = {
                enabled = true,
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
