return {
    'folke/which-key.nvim',
    opts_extend = { 'spec' },
    config = function()
        local wk = require('which-key')

        wk.setup({
            preset = 'helix',
            delay = 200,
            notify = true,
            win = { border = 'single' },
            defaults = {},
        })

        -- stylua: ignore start
        wk.add({
            {
                mode = { 'n' },
                { '<leader>b', group = 'Buffers', icon = { icon = '', color = 'red' }, },
                { '<leader>c', group = 'Code', icon = { icon = ' ', color = 'red' }, },
                { '<leader>r', group = 'Rename', icon = { icon = '' }, },
                { '<leader>R', group = 'Rest', icon = { icon = '' }, },
                { '<leader>s', group = 'Pick', icon = { icon = '', color = 'purple' }, },
                { '<leader>w', group = 'Tailwind', icon = { icon = '󱏿', color = 'cyan' }, },
                { '<leader>T', group = 'Toggle', },
            },
        })
        -- stylua: ignore end
    end,
}
