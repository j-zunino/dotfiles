vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.src:find('LuaSnip') and ev.data.kind == 'install' then
      -- ensure plugin is loaded before building
      if not ev.data.active then
        vim.cmd.packadd('LuaSnip')
      end

      vim.fn.system({ 'make', 'install_jsregexp' })
    end
  end,
})

vim.pack.add({
    { src = 'https://github.com/L3MON4D3/LuaSnip', vim.version.range('^v2') },
    'https://github.com/rafamadriz/friendly-snippets',
})

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
