return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    lazy = true,

    config = function()
        local luasnip = require('luasnip')
        local f = luasnip.function_node
        local postfix = require('luasnip.extras.postfix').postfix

        require('luasnip.loaders.from_vscode').lazy_load({
            include = { 'javascriptreact', 'typescriptreact' },
        })

        luasnip.filetype_extend('javascriptreact', { 'html' })
        luasnip.filetype_extend(
            'typescriptreact',
            { 'html', 'javascriptreact' }
        )

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
    end,
}
