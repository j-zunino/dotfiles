vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.align').setup()
require('mini.bufremove').setup()
require('mini.cursorword').setup()
require('mini.diff').setup({ delay = { text_change = 100 } })
require('mini.extra').setup()
require('mini.pairs').setup()
require('mini.splitjoin').setup()
require('mini.surround').setup()
require('mini.tabline').setup()

-- ai
require('mini.ai').setup({ -- https://github.com/echasnovski/mini.nvim/discussions/1434#discussion-7748816
    custom_textobjects = {
        e = {
            {
                '%u[%l%d]+%f[^%l%d]',
                '%f[^%s%p][%l%d]+%f[^%l%d]',
                '^[%l%d]+%f[^%l%d]',
                '%f[^%s%p][%a%d]+%f[^%a%d]',
                '^[%a%d]+%f[^%a%d]',
            },
            '^().*()$',
        },
    },
})

-- Bufremove
vim.keymap.set(
    'n',
    '<leader>x',
    require('mini.bufremove').delete,
    { noremap = true, silent = true, desc = 'Close buffer' }
)

-- Diff
vim.keymap.set('n', '<leader>Td', function()
    require('mini.diff').toggle_overlay(0)
end, { desc = 'Toggle diff', noremap = true, silent = true })

-- Icons
local dir = { hl = 'Function' }
require('mini.icons').setup({
    require('mini.icons').mock_nvim_web_devicons(),
    default = { directory = dir },
    extension = { md = { glyph = '', hl = 'MiniIconsGray' } },
    file = {
        README = { glyph = '', hl = 'MiniIconsGray' },
        ['README.md'] = { glyph = '', hl = 'MiniIconsGray' },
        ['README.txt'] = { glyph = '', hl = 'MiniIconsGray' },
    },
})

-- Indentscope
require('mini.indentscope').setup({
    symbol = '│',
    options = { n_lines = 500 },
    draw = {
        delay = 200,
        animation = require('mini.indentscope').gen_animation.none(),
        predicate = function(scope)
            return scope.border.indent > 1
        end,
    },
})
