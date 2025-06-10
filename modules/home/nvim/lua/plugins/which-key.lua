return {
    'folke/which-key.nvim',
    opts_extend = { 'spec' },
    config = function()
        local wk = require('which-key')

        ---@diagnostic disable-next-line: missing-fields
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
                { '<leader>a', group = 'Avante', icon = { icon = '', color = 'yellow' }, },
                { '<leader>b', group = 'Buffers', icon = { icon = '', color = 'red' }, },
                { '<leader>C', group = 'Color', icon = { icon = ' ', color = 'red' }, },
                { '<leader>c', group = 'Code', icon = { icon = ' ', color = 'red' }, },
                { '<leader>ct', group = 'Typescript', icon = { icon = '', color = 'cyan' }, },
                { '<leader>d', group = 'Document', icon = { icon = '󰈙', color = 'cyan' }, },
                { '<leader>g', group = 'Git', icon = { icon = '', color = 'orange' }, },
                { '<leader>gh', group = 'Hunks', icon = { icon = '', color = 'orange' }, },
                { '<leader>l', group = 'Lazygit', icon = { icon = '', color = 'orange' }, },
                { '<leader>lg', group = 'Lazygit', icon = { icon = '', color = 'orange' }, },
                { '<leader>r', group = 'Rename', icon = { icon = '' }, },
                { '<leader>R', group = 'Rest', icon = { icon = '' }, },
                { '<leader>s', group = 'Snacks picker', icon = { icon = '󱥰', color = 'purple' }, },
                { '<leader>w', group = 'Tailwind', icon = { icon = '󱏿', color = 'cyan' }, },
                { '<leader>T', group = 'Toggle', },
            },
        })
        -- stylua: ignore end
    end,
}
