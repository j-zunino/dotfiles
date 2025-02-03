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
        local f = luasnip.function_node
        local postfix = require('luasnip.extras.postfix').postfix

        require('luasnip.loaders.from_vscode').lazy_load({
            include = { 'javascriptreact', 'typescriptreact' },
        })

        luasnip.filetype_extend('javascriptreact', { 'html' })
        luasnip.filetype_extend('typescriptreact', { 'html' })

        luasnip.add_snippets('javascriptreact', {
            postfix({
                trig = '/',
                name = 'React component tag',
                desc = 'Auto-complete React component tag',
            }, {
                f(function(_, parent)
                    return '<' .. parent.snippet.env.POSTFIX_MATCH .. ' />'
                end, {}),
            }),
        })
        luasnip.add_snippets('typescriptreact', {
            postfix({
                trig = '/',
                name = 'React component tag',
                desc = 'Auto-complete React component tag',
            }, {
                f(function(_, parent)
                    return '<' .. parent.snippet.env.POSTFIX_MATCH .. ' />'
                end, {}),
            }),
        })

        vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'NONE' })
        cmp.setup({
            window = {
                completion = {
                    border = 'single',
                    col_offset = 1,
                },
                documentation = {
                    border = 'single',
                    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
                },
            },

            completion = {
                completeopt = 'menu,menuone,preview,noinsert',
                preselect = cmp.PreselectMode.Item,
            },

            view = {
                entries = {
                    follow_cursor = true,
                },
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
                { name = 'nvim_lsp', keyword_lenth = 0 },
                { name = 'path', keyword_lenth = 2 },
                { name = 'luasnip', keyword_lenth = 0 },

                { name = 'buffer', keyword_lenth = 4 },
                { name = 'spell', keyword_lenth = 4 },
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
