return {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'LspAttach',
    version = false,
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        -- require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load({
            include = { 'javascriptreact', 'typescriptreact' },
        })
        luasnip.filetype_extend('javascriptreact', { 'html' })
        luasnip.filetype_extend('typescriptreact', { 'html' })

        cmp.setup({
            window = {},
            completion = {
                completeopt = 'menu,menuone,preview,noinsert',
                preselect = cmp.PreselectMode.Item,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),

                ['<C-e>'] = cmp.mapping.abort({ select = true }),

                ['<C-Space>'] = cmp.mapping.complete({}),

                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            },
            formatting = {
                format = lspkind.cmp_format({
                    max_width = 50,
                    elllipsis_char = '...',
                }),
            },
        })
    end,
}
