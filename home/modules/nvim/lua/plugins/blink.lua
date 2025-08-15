return {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'InsertEnter',
    dependencies = {
        'rafamadriz/friendly-snippets',
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    opts = {
        keymap = {
            preset = 'super-tab',
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
        },

        snippets = { preset = 'luasnip' },
        signature = { enabled = true },

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

        completion = {
            ghost_text = { enabled = false },
            documentation = { auto_show = true },
            accept = { auto_brackets = { enabled = false } },

            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },

            menu = {
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
    opts_extend = { 'sources.default' },
}
