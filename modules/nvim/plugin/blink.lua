vim.pack.add({
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('^v1'),
    },
    {
        src = 'https://github.com/L3MON4D3/LuaSnip',
        version = vim.version.range('^v2'),
    },
    'https://github.com/rafamadriz/friendly-snippets',
})

require('blink.cmp').setup({
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
})
